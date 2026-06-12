#!/usr/bin/env python3
"""
Upload a local folder to S3 for a small business backup archive.

Usage:
  python scripts/s3_backup.py --bucket my-bucket --source ./Test_Project_Results --prefix backups/test-results

Requirements:
  pip install boto3
  AWS credentials configured through role, SSO, environment, or profile.
"""

from __future__ import annotations

import argparse
import os
from pathlib import Path
import boto3


def upload_directory(bucket: str, source: Path, prefix: str) -> None:
    if not source.exists() or not source.is_dir():
        raise ValueError(f"Source directory does not exist: {source}")

    s3 = boto3.client("s3")

    for root, _, files in os.walk(source):
        for filename in files:
            local_path = Path(root) / filename
            relative_path = local_path.relative_to(source).as_posix()
            key = f"{prefix.rstrip('/')}/{relative_path}" if prefix else relative_path

            print(f"Uploading {local_path} -> s3://{bucket}/{key}")
            s3.upload_file(str(local_path), bucket, key)


def main() -> None:
    parser = argparse.ArgumentParser(description="Upload a directory to S3.")
    parser.add_argument("--bucket", required=True, help="Target S3 bucket name.")
    parser.add_argument("--source", required=True, help="Local source directory.")
    parser.add_argument("--prefix", default="", help="S3 key prefix.")
    args = parser.parse_args()

    upload_directory(args.bucket, Path(args.source), args.prefix)
    print("Upload completed.")


if __name__ == "__main__":
    main()
