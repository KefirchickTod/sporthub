Country
has_many :teams
Category
has_many :teams
has_many :articles
has_many :children, class_name: "Category", foreign_key: "parent_id", dependent: :destroy
belongs_to :parent, class_name: "Category", optional: true
Team
belongs_to :category
belongs_to :country
has_and_belongs_to_many :users

Artice
belongs_to :category
belongs_to :team
belongs_to :country
active?

PhotoAsset
active?
active_storage
VideoAsset
active?
carrierwave

STI_MODEL MainArticle
BreacDown
belongs_to :category
belongs_to :team
active?

MainArticle
belongs_to :category
belongs_to :team
belongs_to :article
active?

Network
belongs_to :social_placemnt, through: :NetworkActivation

NetworkActivation
active?

SocialNetworkplacement
belongs_to :social_network, through: :NetworkActivation

Survey
status :enum # int
has_many :survey_answers
has_many :survey_options
SurveyOption
belongs_to :survey
has_many :survey_answers

SurveyAnswer
belongs_to :user
belongs_to :survey_option
belongs_to :survey

Language
has_and_belongs_to_many :banners
active?

Banner
belongs_to :category
status :enum # string
has_and_belongs_to_many :languages

STI_MODEL
Footer
active?

FooterInfo
FooterContributor
FooterSubscrube

User
has_many :survey_answers
has_and_belongs_to_many :teams
active?
#-----------------------
rolify gem
