class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '誕生日' },
    { id: 3, name: '記念日' },
    { id: 4, name: '初めての...' },
    { id: 5, name: 'イベント' },
    { id: 6, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :anniversaries

end

