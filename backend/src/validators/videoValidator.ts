import { body, param, query } from "express-validator";

const validateIdParam = param("id")
	.isString()
	.withMessage("id must be a string.")
	.trim();

const validateLikeCount = body("likeCount")
	.isNumeric()
	.withMessage("likeCount must be a number.");

const validateCaption = body("caption")
	.optional()
	.isString()
	.withMessage("caption must be a string.");

const validateAuthor = body("author")
	.isString()
	.withMessage("author must be a string.")
	.trim()
	.notEmpty()
	.withMessage("author is required.");

export const createVideoValidator = [
	validateCaption,
	validateLikeCount,
	validateAuthor,
];

export const getVideovalidator = [validateIdParam];

export const updateVideoValidator = [
	validateIdParam,
	validateCaption.optional(),
	validateLikeCount.optional(),
	validateAuthor.optional(),
];

export const deleteVideoValidator = [validateIdParam];

export const videoCookingValidator = [];
export const videoLaundryValidator = [];
export const videoNutritionValidator = [];
