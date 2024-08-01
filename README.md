# Blog ROR

Blog ROR is a Ruby on Rails application that allows users to create, read, update, and delete blog posts. It includes user authentication and image upload functionality.

<img width="569" alt="image" src="https://github.com/user-attachments/assets/3300d90d-0cdd-4270-9163-2aa2c8908bed">

## Features

- User authentication (sign up, log in, log out)
- Create, read, update, and delete blog posts
- Image upload for blog posts
- Responsive design using Bootstrap
- Pagination for blog posts
- Search functionality for blog posts

## Technologies Used

- Ruby 3.x
- Rails 7.x
- PostgreSQL
- Bootstrap 5
- Devise for authentication
- Active Storage for image uploads
- Kaminari for pagination

## Setup

To run this project locally:

1. Clone the repository
git clone https://github.com/animeshdesh/Blog_ROR.git
cd Blog_ROR

2. Install dependencies
bundle install

3. Setup the database
rails db:create
rails db:migrate

4. Start the Rails server
rails server

5. Open your browser and navigate to `http://localhost:3000`

## Usage

- Sign up for an account or log in if you already have one
- Create a new blog post by clicking on "New Blog"
- View all blog posts on the homepage
- Click on a blog post to view its details
- Edit or delete your own blog posts
- Use the search bar to find specific blog posts

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)
