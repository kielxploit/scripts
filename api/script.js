import fs from "fs";
import path from "path";

export default function handler(req, res) {
    const { script } = req.query; // dynamic name from URL

    if (!script) {
        return res.status(400).send("No script specified");
    }

    const filePath = path.join(process.cwd(), "scripts", `${script}.lua`);

    if (!fs.existsSync(filePath)) {
        return res.status(404).send("Script not found");
    }

    try {
        const content = fs.readFileSync(filePath, "utf8");

        res.setHeader("Content-Type", "text/plain; charset=utf-8");
        res.status(200).send(content);
    } catch (err) {
        res.status(500).send("Internal Server Error");
    }
}
