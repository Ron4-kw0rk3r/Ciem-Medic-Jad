import os
import time
import json

def list_image_files(directory):
    image_extensions = ('.png', '.jpg', '.jpeg', '.bmp', '.tiff')
    return [f for f in os.listdir(directory) if f.lower().endswith(image_extensions)]

def create_or_update_json(directory, image_files):
    json_path = os.path.join(directory, 'imagenes.json')
    data = {"images": image_files}
    with open(json_path, 'w') as json_file:
        json.dump(data, json_file, indent=4)

def monitor_images(directory, interval=3600):
    while True:
        image_files = list_image_files(directory)
        print(f"Found {len(image_files)} image files:")
        for image in image_files:
            print(image)
        create_or_update_json(directory, image_files)
        time.sleep(interval)

if __name__ == "__main__":
    directory = os.path.dirname(os.path.abspath(__file__))
    monitor_images(directory)
