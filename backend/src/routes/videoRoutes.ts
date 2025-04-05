import express from "express";
import multer from "multer";
import * as videoController from "../controllers/videoController";
import * as videoValidator from "../validators/videoValidator";

const videoRouter = express.Router();
const storage = multer.memoryStorage();
const upload = multer({ storage });

videoRouter.get(
	"/:id",
	videoValidator.getVideovalidator,
	videoController.getVideoById
);

videoRouter.patch(
	"/:id",
	upload.single("video"),
	videoValidator.updateVideoValidator,
	videoController.updateVideo
);

videoRouter.delete(
	"/:id",
	videoValidator.deleteVideoValidator,
	videoController.deleteVideo
);

videoRouter.get("/", videoController.getVideos);

videoRouter.post(
	"/",
	upload.single("video"),
	videoValidator.createVideoValidator,
	videoController.createVideo
);

export default videoRouter;
