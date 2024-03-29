const axios = require("axios");
const baseUrl = "/api/login";

const login = async (credentials) => {
	console.log("this", credentials)
	const res = await axios.post(baseUrl, credentials);
	return res.data;
};

export default { login };