#!/usr/bin/env python3
"""This script is a work in progress as to it's placement on gitHub.
This script will delete directories and file that it creates for the archiving
process: USE CAUTION!
"""
import os
import sys
import shutil
from time import sleep

# Populate the source key list, with the file names you wish to archive
# Populate the dest key list, with the new names of the key list files
files_dict = {
        "src": [
            ".vimrc",
            ".bashrc",
            ".bash_aliases",
            ".nanorc",
            ],
        "dest": [
            "vimrc.bak",
            "bashrc.bak",
            "bash_aliases.bak",
            "nanorc.bak",
            ],
        }


def sl(n: int = 5) -> None:
    """Sleeps for n seconds.

    Args:
        n (int, optional): Number of seconds to sleep. Defaults to 5.
    """
    sleep(n)


# You will need to change $USER to your Linux user name
def log_it(log_text: str, log_file: str = "null.log") -> None:
    """Logs passed string to the associated log file.

    Args:
        log_text (str): String of text to write to the log file.
        log_file (str): Name of the log file.
    """
    try:
        with open(f"/home/$USER/logfiles/{log_file}", "a") as fo:
            fo.write(log_text + "\n")
    except FileNotFoundError:
        pass


if __name__ == "__main__":
    if len(sys.argv) > 1:
        print(shutil.get_archive_formats())
        sys.exit()

    PATH_TO_FILES = os.path.expanduser(os.path.join("~"))
    PATH_TO_ARCHIVE = os.path.expanduser(os.path.join("~", "archives"))
    PATH_TO_TEMPDIR = os.path.expanduser(os.path.join("~", "temp"))
    # ARCHIVE_FILENAME = "py-dotfiles"
    ARCHIVE_FILENAME = "test-tar"
    PATH_TO_ARCHIVE_FILENAME = os.path.expanduser(
            os.path.join("~", "archives", ARCHIVE_FILENAME)
            )
    TAR_FILE_EXT = "tar"

    if os.path.isdir(PATH_TO_TEMPDIR):
        shutil.rmtree(PATH_TO_TEMPDIR)

    if not os.path.isdir(PATH_TO_TEMPDIR):
        os.makedirs(PATH_TO_TEMPDIR)

    if (
            not os.path.isdir(PATH_TO_FILES)
            or not os.path.isdir(PATH_TO_ARCHIVE)
            or not os.path.isdir(PATH_TO_TEMPDIR)
            ):
        log_it("ERROR 1")
        sys.exit()

    if os.path.isdir(PATH_TO_TEMPDIR):
        for i, files in enumerate(files_dict["src"]):
            shutil.copy(
                    os.path.join(PATH_TO_FILES, files),
                    os.path.join(PATH_TO_TEMPDIR, files_dict["dest"][i]),
                    )
    else:
        log_it("ERROR 2")
        sys.exit()

    if os.path.isfile(os.path.join(PATH_TO_ARCHIVE_FILENAME + "." + TAR_FILE_EXT)):
        os.remove(os.path.join(PATH_TO_ARCHIVE_FILENAME + "." + TAR_FILE_EXT))

    shutil.make_archive(PATH_TO_ARCHIVE_FILENAME, TAR_FILE_EXT, PATH_TO_TEMPDIR)

    if os.path.isfile(os.path.join(PATH_TO_ARCHIVE_FILENAME + "." + TAR_FILE_EXT)):
        log_it("Test of dotfiles.py complete.")

        if os.path.isdir(PATH_TO_TEMPDIR):
            shutil.rmtree(PATH_TO_TEMPDIR)
