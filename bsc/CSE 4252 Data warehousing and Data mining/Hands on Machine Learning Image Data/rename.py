import os

# Function to rename the images
def rename_images(folder_path):
    # Get the list of subfolders
    subfolders = [f.path for f in os.scandir(folder_path) if f.is_dir()]

    # Iterate through each subfolder
    for subfolder in subfolders:
        # Get the subfolder name
        subfolder_name = os.path.basename(subfolder)
        # Get the list of images in the subfolder
        images = [f.path for f in os.scandir(subfolder) if f.is_file() and f.name.lower().endswith(('.png', '.jpg', '.jpeg'))]
        
        # Iterate through each image in the subfolder
        for i, image_path in enumerate(images, start=1):
            # Create the new file name
            new_name = f"{subfolder_name}-{i}{os.path.splitext(image_path)[1]}"
            # Rename the image
            os.rename(image_path, os.path.join(subfolder, new_name))

# Provide the path to the folder containing subfolders with images
folder_path = "shoe"

# Call the function to rename the images
rename_images(folder_path)

print("Image renaming complete!")
