import fs from "fs";
import path from "path";

export default function handler(req, res) {
    const { name } = req.query;

    if (!name) {
        return res.status(400).send("No script name provided");
    }

    const filePath = path.join(process.cwd(), "scripts", `${name}.lua`);

    if (!fs.existsSync(filePath)) {
        return res.status(404).send("Script not found");
    }

    const content = fs.readFileSync(filePath, "utf8");

    res.setHeader("Content-Type", "text/plain");
    res.status(200).send(content);
}
