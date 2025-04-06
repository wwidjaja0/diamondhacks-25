import { InferSchemaType, Schema, model } from "mongoose";

const userSchema = new Schema({
	_id: {
		type: String,
	},
	name: {
		type: String,
		required: true,
	},
	/*
	friends: {
		type: [Schema.Types.ObjectId],
		required: true,
	},
	*/
	profilePicture: {
		type: String,
	},
});

type User = InferSchemaType<typeof userSchema>;

export default model<User>("User", userSchema);
