import s3 from "./s3Client";
import { v4 as uuidv4 } from "uuid";
import { PutObjectCommand, ObjectCannedACL } from "@aws-sdk/client-s3";
import { Multer } from "multer";

const s3Upload = async (file: Express.Multer.File): Promise<string> => {
	if (!file) {
		throw new Error("No file provided.");
	}

	const fileExtension = file.originalname.split(".").pop();
	const fileKey = `videos/${uuidv4()}.${fileExtension}`;

	const params = {
		Bucket: process.env.AWS_BUCKET_NAME,
		Key: fileKey,
		Body: file.buffer,
		ContentType: file.mimetype,
		ACL: "public-read" as ObjectCannedACL,
	};

	await s3.send(new PutObjectCommand(params));

	return fileKey;
};

export default s3Upload;
