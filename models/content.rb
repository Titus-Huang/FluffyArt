
def all_contents
    run_sql("SELECT * FROM contents")
end

def all_contents_by_date
    run_sql("SELECT * FROM contents ORDER BY post_timestamp")
end

def count_all_content
    run_sql("SELECT COUNT(*) from contents")[0]['count'].to_i
end

def latest_5_contents
    run_sql("SELECT * FROM contents ORDER BY post_timestamp DESC LIMIT 5")
end

def latest_25_contents
    run_sql("SELECT * FROM contents ORDER BY post_timestamp DESC LIMIT 5")
end

def create_content(user_id, title, content, content_description, is_image, is_html)
    run_sql("INSERT INTO contents(user_id, post_timestamp, edit_timestamp, title, content, content_description, is_image, is_html) VALUES($1, now(), TO_TIMESTAMP(0), $2, $3, $4, $5, $6)", [user_id, title, content, content_description, is_image, is_html])
end

def get_content(id)
    run_sql("SELECT * FROM contents WHERE id = $1", [id])[0]
end

def update_content(id, title, content, content_description, is_image, is_html)
    run_sql("UPDATE contents SET edit_timestamp = now(), title = $2, content = $3, content_description = $4, is_image = $5, is_html = $6 WHERE id = $1", [id, title, content, content_description, is_image, is_html])
end

def delete_content(id)
    run_sql("DELETE FROM contents WHERE id = $1", [id])
end



def truncate_content_string(string)
    if string.length > 120
        truncated_string = string.slice(0..120) + "..."
        return truncated_string
    end
    string
end

def transform_images_limit_by_width(image_url, alt_text, width)
    # cl_image_tag(image_url, :folder => "fluffyart-cdn/img/alt/", :secure=>"true", :alt=> alt_text, :width=>width, :quality=>"auto", :fetch_format=>:auto)
    if image_url.include? "https://res.cloudinary.com/"
        arr = image_url.split("upload/")
        transform_url = arr[0] + "upload/" + "c_scale,w_#{width}/" + arr[1]
    else
        puts ">>> WARNING: Not a Cloudinary link, image will not be rescaled <<<"
        transform_url = image_url
    end
    return "<img src=\"#{transform_url}\" alt=\"#{alt_text}\">"
end

def transform_images_limit_by_height(image_url, alt_text, height)
    # cl_image_tag(image_url, :folder => "fluffyart-cdn/img/alt/", :secure=>"true", :alt=> alt_text, :height=>height, :quality=>"auto", :fetch_format=>:auto)

    if image_url.include? "https://res.cloudinary.com/"
        arr = image_url.split("upload/")
        transform_url = arr[0] + "upload/" + "c_scale,h_#{height}/" + arr[1]
    else
        puts ">>> WARNING: Not a Cloudinary link, image will not be rescaled <<<"
        transform_url = image_url
    end
    return "<img src=\"#{transform_url}\" alt=\"#{alt_text}\">"
end