// 101470163 Liz Cruz

const express = require("express");
const Task = require("../models/Task");

const router = express.Router();

// create new task
router.post("/create", async (req, res) => {
  try {
    const { title, dueDate, projectId } = req.body;

    if (!title || !dueDate || !projectId) {
      return res.status(400).json({ message: "All fields are required" });
    }

    const newTask = new Task({
      title,
      dueDate: new Date(dueDate),
      projectId
    });

    await newTask.save();

    res.status(201).json({ message: "Task created successfully", task: newTask });
  } catch (error) {
    res.status(500).json({ message: "Server error" });
  }
});

// get all tasks by project
router.get("/project/:projectId", async (req, res) => {
  try {
    const { projectId } = req.params;
    const tasks = await Task.find({ projectId });

    res.json(tasks);
  } catch (error) {
    res.status(500).json({ message: "Server error" });
  }
});

// change task to completed
router.put("/:taskId/complete", async (req, res) => {
  try {
    const { taskId } = req.params;

    const task = await Task.findByIdAndUpdate(taskId, { isCompleted: true }, { new: true });

    if (!task) {
      return res.status(404).json({ message: "Task not found" });
    }

    res.json({ message: "Task marked as completed", task });
  } catch (error) {
    res.status(500).json({ message: "Server error" });
  }
});

// remove a task
router.delete("/:taskId", async (req, res) => {
  try {
    const { taskId } = req.params;

    const deletedTask = await Task.findByIdAndDelete(taskId);

    if (!deletedTask) {
      return res.status(404).json({ message: "Task not found" });
    }

    res.json({ message: "Task deleted successfully" });
  } catch (error) {
    res.status(500).json({ message: "Server error" });
  }
});

module.exports = router;
