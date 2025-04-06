import s3Upload from "../aws/s3Upload";
import Video from "../models/Video";
import { matchedData, validationResult } from "express-validator";
import asyncHandler from "express-async-handler";
import createHttpError from "http-errors";
import validationErrorParser from "../util/validationErrorParser";

// @desc Get all videos
// @route GET /api/videos
// @access Private
export const getVideos = asyncHandler(async (_, res) => {
	const videos = await Video.find().exec();

	res.status(200).json(videos);
});

// @desc Get videos with laundry-related captions
// @route GET /api/videos/laundry
// @access Private
export const laundry = asyncHandler(async (_, res) => {
	const videos = await Video.find({
		caption: {
			$regex: /(laundry|detergent|clothes)/i,
		},
	}).exec();

	res.status(200).json(videos);
});

// @desc Get videos with laundry-related captions
// @route GET /api/videos/cooking
// @access Private
export const cooking = asyncHandler(async (_, res) => {
	const videos = await Video.find({
		caption: {
			$regex: /(cooking|baking|cook|survive)/i,
		},
	}).exec();

	res.status(200).json(videos);
});

// @desc Get videos with laundry-related captions
// @route GET /api/videos/nutrition
// @access Private
export const nutrition = asyncHandler(async (_, res) => {
	const videos = await Video.find({
		caption: {
			$regex: /(nutrition|health|diet|foods)/i,
		},
	}).exec();

	res.status(200).json(videos);
});

// @desc Create new video
// @route POST /api/videos
// @access Private
export const createVideo = asyncHandler(async (req, res, next) => {
	const reqErrors = validationResult(req);
	if (!reqErrors.isEmpty()) {
		return next(createHttpError(400, validationErrorParser(reqErrors)));
	}

	const { likeCount, caption, author, thumbnailUrl } = matchedData(req, {
		locations: ["body"],
	});

	let videoKey = null;
	if (req.file) {
		videoKey = await s3Upload(req.file);
	}

	const newVideo = new Video({
		videoKey,
		likeCount,
		caption,
		author,
		thumbnailUrl,
	});

	await newVideo.save();

	res.status(201).json(newVideo);
});

// @desc Get video by ID
// @route GET /api/videos/:id
// @access Private
export const getVideoById = asyncHandler(async (req, res, next) => {
	const { id } = matchedData(req, { locations: ["params"] });

	// check if the Video exists
	const foundVideo = await Video.findById(id).exec();
	if (!foundVideo) {
		return next(createHttpError(404, "Video not found."));
	}

	res.status(200).json(foundVideo);
});

// @desc Update a video
// @route PATCH /api/videos/:id
// @access Private
export const updateVideo = asyncHandler(async (req, res, next) => {
	const errors = validationResult(req);
	if (!errors.isEmpty()) {
		return next(createHttpError(400, validationErrorParser(errors)));
	}

	const { id } = matchedData(req, { locations: ["params"] });
	const validatedData = matchedData(req, { locations: ["body"] });

	if (req.file) {
		validatedData.videoKey = await s3Upload(req.file);
	}

	if (Object.keys(validatedData).length === 0) {
		return next(createHttpError(400, "At least one field required to update."));
	}

	const foundVideo = await Video.findByIdAndUpdate(
		id,
		{ $set: validatedData },
		{ new: true, runValidators: true }
	).exec();

	if (!foundVideo) {
		return next(createHttpError(404, "Video not found."));
	}

	res.status(200).json(foundVideo);
});

// @desc Delete a Video
// @route DELETE /api/videos/:id
// @access Private
export const deleteVideo = asyncHandler(async (req, res, next) => {
	const errors = validationResult(req);
	if (!errors.isEmpty()) {
		return next(createHttpError(400, validationErrorParser(errors)));
	}

	const { id } = matchedData(req, { locations: ["params"] });

	const foundVideo = await Video.findByIdAndDelete(id);

	if (!foundVideo) {
		return next(createHttpError(404, "Video not found."));
	}

	res.status(200).json(foundVideo);
});
