import express from "express";
import * as userController from "../controllers/userController";
import * as userValidator from "../validators/userValidator";

const userRouter = express.Router();

userRouter.get(
	"/:id",
	userValidator.getUservalidator,
	userController.getUserById
);

userRouter.patch(
	"/:id",
	userValidator.updateUserValidator,
	userController.updateUser
);

userRouter.delete(
	"/:id",
	userValidator.deleteUserValidator,
	userController.deleteUser
);

userRouter.get("/", userController.getUsers);

userRouter.post(
	"/",
	userValidator.createUserValidator,
	userController.createUser
);

export default userRouter;
