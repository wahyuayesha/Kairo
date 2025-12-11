from flask import Flask, request, jsonify
from ultralytics import YOLO
import cv2
import base64
import numpy as np

app = Flask(__name__)

model = YOLO("best.pt")

@app.route('/predict', methods=['POST'])
def predict_class():

    data = request.get_json()
    img_base64 = data.get("image")

    if img_base64 is None:
        return jsonify({"error": "image base64 is required"}), 400

    # decode base64 ke array cv2
    img_bytes = base64.b64decode(img_base64)
    img_array = np.frombuffer(img_bytes, np.uint8)
    img = cv2.imdecode(img_array, cv2.IMREAD_COLOR)

    results = model(img)

    # ambil daftar class
    classes = []
    for box in results[0].boxes:
        cls_id = int(box.cls[0])
        conf = float(box.conf[0])
        class_name = model.names[cls_id]
        classes.append({"class_name": class_name, "confidence": conf})

    # gambar annotated
    annotated = results[0].plot()

    _, buffer = cv2.imencode(".jpg", annotated)
    annotated_base64 = base64.b64encode(buffer).decode("utf-8")

    return jsonify({
        "classes": classes,
        "image": annotated_base64
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
