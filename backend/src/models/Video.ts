import { InferSchemaType, Schema, model } from "mongoose";

const videoSchema = new Schema(
	{
		videoKey: {
			type: String,
			default: null,
		},
		likeCount: {
			type: String,
			required: true,
		},
		thumbnailUrl: {
			type: String,
			required: false,
		},
		caption: {
			type: String,
			required: false,
		},
		author: {
			type: String,
			required: true,
		},
	},
	{
		timestamps: true,
		toJSON: { virtuals: true },
		toObject: { virtuals: true },
	}
);

type Video = InferSchemaType<typeof videoSchema>;

const AWS_BUCKET_URL = `https://${process.env.AWS_BUCKET_NAME}.s3.${process.env.AWS_REGION}.amazonaws.com/`;

videoSchema.virtual("video").get(function () {
	if (this.videoKey) {
		return new URL(this.videoKey, AWS_BUCKET_URL).href;
	}
	return null;
});

const generateVideoUrl = async (doc: Video) => {
	if (doc.videoKey) {
		return new URL(doc.videoKey, AWS_BUCKET_URL).href;
	}
};

videoSchema.post("find", async function (docs) {
	for (const doc of docs) {
		await generateVideoUrl(doc);
	}
});

videoSchema.post("findOne", async function (doc) {
	if (doc) {
		await generateVideoUrl(doc);
	}
});

export default model<Video>("Video", videoSchema);
