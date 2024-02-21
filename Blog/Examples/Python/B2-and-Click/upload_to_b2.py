import click
from datetime import datetime
import os
from b2sdk.v2 import InMemoryAccountInfo, B2Api

B2_BUCKET = ''
B2_KEY = ''
B2_APP_KEY = ''

@click.command()
@click.argument('file_to_upload', type=click.Path(exists=True))
@click.option('--year', default=datetime.now().year, help='Year of post')
@click.option('--month', default=datetime.now().strftime("%m"), help='Month of post')
@click.option('--slug', help='Slug of post or where to save the media (ex. folder-to-store-files-in)')
def main(year, month, slug, file_to_upload):
    click.echo(f"{click.style('Year:', bold=True)} {year}, {click.style('Month:', bold=True)} {month}, {click.style('Slug:', bold=True)} {slug}")

    info = InMemoryAccountInfo()
    b2_api = B2Api(info)
    b2_api.authorize_account("production", B2_KEY, B2_APP_KEY)
    bucket = b2_api.get_bucket_by_name(B2_BUCKET)

    original_file_name = os.path.basename(file_to_upload)
    destination_path = f"{year}/{month}/{slug}/{original_file_name}"

    # Upload file
    b2_file = bucket.upload_local_file(
        local_file=file_to_upload,
        file_name=destination_path
    )
    click.echo(f"File uploaded to B2: {click.style(f'https://bucket.example.com/{year}/{month}/{slug}/{original_file_name}', fg='bright_blue', bold=True)}")

if __name__ == '__main__':
    main()
