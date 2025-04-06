import User from "../models/User";
import { matchedData, validationResult } from "express-validator";
import asyncHandler from "express-async-handler";
import createHttpError from "http-errors";
import validationErrorParser from "../util/validationErrorParser";

// @desc Get all users
// @route GET /api/users
// @access Private
export const getUsers = asyncHandler(async (_, res) => {
	const users = await User.find().exec();

	res.status(200).json(users);
});

// @desc Create new user
// @route POST /api/users
// @access Private
export const createUser = asyncHandler(async (req, res, next) => {
	const reqErrors = validationResult(req);
	if (!reqErrors.isEmpty()) {
		return next(createHttpError(400, validationErrorParser(reqErrors)));
	}

	const { _id, name, profilePicture } = matchedData(req, {
		locations: ["body"],
	});

	const foundUser = await User.findOne({
		$or: [{ _id }, { name }],
	}).exec();

	if (foundUser) {
		return next(createHttpError(409, "User already exists."));
	}

	const newUser = new User({
		_id,
		name,
		profilePicture,
	});

	await newUser.save();

	res.status(201).json(newUser);
});

// @desc Get user by ID
// @route GET /api/users/:id
// @access Private
export const getUserById = asyncHandler(async (req, res, next) => {
	const { id } = matchedData(req, { locations: ["params"] });

	// check if the user exists
	const foundUser = await User.findById(id).exec();
	if (!foundUser) {
		return next(createHttpError(404, "User not found."));
	}

	res.status(200).json(foundUser);
});

// @desc Update a user
// @route PATCH /api/users/:id
// @access Private
export const updateUser = asyncHandler(async (req, res, next) => {
	const errors = validationResult(req);
	if (!errors.isEmpty()) {
		return next(createHttpError(400, validationErrorParser(errors)));
	}

	const { id } = matchedData(req, { locations: ["params"] });
	const validatedData = matchedData(req, { locations: ["body"] });

	if (Object.keys(validatedData).length === 0) {
		return next(createHttpError(400, "At least one field required to update."));
	}

	const foundUser = await User.findByIdAndUpdate(
		id,
		{ $set: validatedData },
		{ new: true, runValidators: true }
	).exec();

	if (!foundUser) {
		return next(createHttpError(404, "User not found."));
	}

	res.status(200).json(foundUser);
});

// @desc Delete a user
// @route DELETE /api/users/:id
// @access Private
export const deleteUser = asyncHandler(async (req, res, next) => {
	const errors = validationResult(req);
	if (!errors.isEmpty()) {
		return next(createHttpError(400, validationErrorParser(errors)));
	}

	const { id } = matchedData(req, { locations: ["params"] });

	const foundUser = await User.findByIdAndDelete(id);

	if (!foundUser) {
		return next(createHttpError(404, "User not found."));
	}

	res.status(200).json(foundUser);
});
