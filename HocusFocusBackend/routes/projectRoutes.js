//// Kaman Wong 101424041
const express = require("express");
const Project = require("../models/Project");
const Task = require("../models/Task");

const router = express.Router();

// Creating a new project with user ID as owner
router.post("/create", async (req, res) => {
    try {
        const { title, details, dueDate, createdBy } = req.body;

        if (!title || !details || !dueDate || !createdBy) {
            return res.status(400).json({ message: "All fields are required" });
        }

        const formattedDueDate = new Date(dueDate);
        const newProject = new Project({ title, details, dueDate: formattedDueDate, createdBy });
        await newProject.save();

        res.status(201).json({ message: "Project created successfully", project: newProject });
    } catch (error) {
        res.status(500).json({ message: "Server error" });
    }
});

// Fetching all projects for a specific user
router.get("/:userId", async (req, res) => {
    try {
        const userId = req.params.userId;
        const projects = await Project.find({ createdBy: userId });

        const projectsWithTasks = await Promise.all(
            projects.map(async (project) => {
                const tasks = await Task.find({ projectId: project._id });
                return {
                    ...project.toObject(),
                    tasks: tasks
                };
            })
        );

        res.json(projectsWithTasks);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Server error" });
    }
});



// DELETE a project
router.delete("/:projectId", async (req, res) => {
    try {
        const { projectId } = req.params;

        await Task.deleteMany({ projectId });

        // remove project
        const deletedProject = await Project.findByIdAndDelete(projectId);

        if (!deletedProject) {
            return res.status(404).json({ message: "Project not found" });
        }

        res.json({ message: "Project and associated tasks deleted successfully" });
    } catch (error) {
        res.status(500).json({ message: "Server error" });
    }
});

module.exports = router;
