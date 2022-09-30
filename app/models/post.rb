class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length:{minimum:250}
    validates :summary, length:{maximum:250}
    validates :category, inclusion: { in:['Fiction', 'Non-Fiction'] }    

    validate :title_validator

    def title_validator
        if title
            valid_title = title.downcase
        keywords = ["won't believe", "secret", "top[0..9]", "guess"]
        if keywords.select { |word| valid_title.scan(word).first }.all?{|w|w.nil? }
        # keywords.map{|word| valid_title.include?(/#{word}/)}
            errors.add(:title, "Title must be clickbait-y")
        end
        
    end
    end
end
