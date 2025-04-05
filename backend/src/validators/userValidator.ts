import { body, param, query } from "express-validator";

const validateIdParam = param("id")
	.isString()
	.withMessage("id must be a string.")
	.trim();

const validateIdBody = body("_id")
	.isString()
	.withMessage("_id must be a string.")
	.trim()
	.isLength({ min: 1 })
	.withMessage("_id is required.");

const validateName = body("name")
	.isString()
	.withMessage("name must be a string.")
	.trim()
	.isLength({ min: 1 })
	.withMessage("name must be at least 1 characters.")
	.notEmpty()
	.withMessage("name is required.");

const validateProfilePicture = body("profilePicture")
	.isString()
	.withMessage("profilePicture must be a string.")
	.trim()
	.isURL({ require_valid_protocol: true })
	.withMessage("profilePicture must be a valid URL.");

export const createUserValidator = [
	validateIdBody,
	validateName,
	validateProfilePicture,
];

export const getUservalidator = [validateIdParam];

export const updateUserValidator = [
	validateIdParam,
	validateName.optional(),
	validateProfilePicture.optional(),
];

export const deleteUserValidator = [validateIdParam];
