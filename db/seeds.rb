# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


if User.count == 0
  user = User.new({ email: 'admin@sample.com', password: 'password', username: "superadmin", is_superadmin: true})
  user.save(validate: false)
end

if Season.count == 0
  Season.create(name: "low")
  Season.create(name: "Peak")
  Season.create(name: "Holiday")
  Season.create(name: "NYE")
  Season.create(name: "CNY")
end

if City.count == 0
  City.create(name: "Ho Chi Minh")
  City.create(name: "Ha Noi")
  City.create(name: "Kuala Lumpur")
  City.create(name: "Binangonan")
  City.create(name: "Bangkok")
end

if Department.count == 0
  Department.create(id: 1, name: "Sales")
  Department.create(id: 2, name: "Reservations")
  Department.create(id: 3, name: "Operations")
  Department.create(id: 4, name: "Finance")
end

if Country.count == 0
  Country.create(name: "Vietname")
  Country.create(name: "Singapore")
  Country.create(name: "Lao")
  Country.create(name: "China")
  Country.create(name: "Malaysia")
end

# if HomePage.count == 0
#   HomePage.create({
#     hero_header: 'Grounded by science. Inspired by you.',
#     hero_sub_header: 'What are your goals for your skin health? Sample first listens to you.',
#     hero_link_title: 'Sample Philosophy',
#     hero_link_url: '/our-philosophy',
#     highlight_header: 'Good skin health should be accessible to everyone.<br/>No hidden cost ever, is our promise.',
#     highlight_content: "Regular treatment reviews\r\nAdjusted to your skin condition\r\nNo upgrades nor extra expenses",
#     call_for_action_button_title: 'Contact us now',
#     call_for_action_button_url: '/contact-us',
#     hero_background: File.open("#{Rails.root}/data/images/bg-home.jpg")
#   })
# end
#
# if OurPhilosophyPage.count == 0
#   OurPhilosophyPage.create({
#     hero_header: 'The Sample Philosophy',
#     hero_sub_header: 'At Sample, your lifestyle desires and skin care goals are the inspiration behind the scientific research and development in our treatments and products.',
#     hero_content: 'You lead a full life, looking good should fit into your way of life effortlessly, and yet be attained quickly but effectively. With new generation technologies and a personalised treatment plan, Sample App makes skin pampering and a great complexion a simple luxury that is truly affordable.',
#     hero_background: File.open("#{Rails.root}/data/images/bg-philosophy.jpg"),
#     support_photo: File.open("#{Rails.root}/data/images/img-philosophy.png")
#   })
# end
#
# if ProductPage.count == 0
#   product_page = ProductPage.create({
#     header: 'Innovative products<br/>based on science',
#     content: "Natural ingredients from both Western and Asian traditions that have been trusted for generations for their nutritional, medicinal and dietary benefits are rigorously researched, then extracted in high concentrations, and scientifically formulated together with proven active clinical ingredients into high performing products that are pure nutrients for your skin.\r\n\r\nVisit our studio and receive a complimentary consultation and a trial supply of Sample best performing products that will help you achieve the outcome of your skin care goals.",
#     cfa_title: "See products",
#     background_image: File.open("#{Rails.root}/data/images/bg-products.png"),
#     cfa_url: "/products#prod"
#   })
# end
#
# if TipsNewsPage.count == 0
#   tips_news_page = TipsNewsPage.create({
#     header: 'We love to hear from you!',
#     sub_header: 'The dedicated team of doctors, scientists and derma care specialists at Sample loves to share with you.',
#     content: "Get updated on the latest research and development in technologies and newly discovered ingredients. Benefit from pre-launch product tests, user trials and sampling. Give us your feedback, comments and reviews. We love to connect with you!",
#     cfa_1_title: "Follow us on Facebook",
#     cfa_1_description: "and learn more about skin care innovations from our Notes and Posts.",
#     cfa_1_url: 'https://www.facebook.com/sampleapp',
#     cfa_2_title: "Visit us at the Studio",
#     cfa_2_description: "and receive complimentary samples of our star products.",
#     cfa_2_url: '/contact-us',
#     background_image: File.open("#{Rails.root}/data/images/bg-tipsnews.jpg")
#   })
# end
#
# if ContactUsPage.count == 0
#   contact_us_page = ContactUsPage.create({
#     contact_form_header: "Discover Sample",
#     contact_form_description: "Tell us about your lifestyle, allow us to customise a personalised treatment plan to support you in achieving your skin care goals.",
#     contact_us_header: "Contact Us",
#     contact_us_description: "Visit our Studio to receive complimentary samples of our cosmeceutical products.",
#     address: "<b>Sample Studio @ Golden Shoe</b>\r\n#01-33 Golden Shoe Car Park\r\n(next to the carpark gantry)\r\n50 Market Street, Singapore 048940",
#     mrt_station: "Raffles Place MRT Station (Exit A)",
#     phone: "+65 6557 4253",
#     email: "contact@sampleapp.com",
#     working_hours: "Mon - Fri 10am - 8pm\r\nSat 10am - 2pm\r\nSun Closed"
#   })
# end
#
# if HighlightSection.count == 0
#   HighlightSection.create({
#     header: "Good skin health should be<br/>accessible to everyone.<br/>No hidden cost ever, is our promise.",
#     description: "Regular treatment reviews\r\nAdjusted to your skin condition\r\nNo upgrades nor extra expenses",
#     cfa_title: "Contact us now",
#     cfa_url: "/contact-us",
#     footer_copyright_note: "&copy; Copyright 2015 Sample. All rights reserved.",
#     treatment_1_photo: File.open("#{Rails.root}/app/assets/images/link-home-airnutrients-540x350.jpg"),
#     treatments_1_url: "/tips-news#articles",
#     treatment_2_photo: File.open("#{Rails.root}/app/assets/images/link-home-treatments-540x350.jpg"),
#     treatments_2_url: "/treatments#treat",
#     treatment_small_photo: File.open("#{Rails.root}/app/assets/images/link-footer-treatments-540x160.jpg"),
#     promotions_url: "/promotions",
#     promotion_photo: File.open("#{Rails.root}/app/assets/images/link-home-promotions-540x350.jpg"),
#     products_url: "/products",
#     products_big_photo: File.open("#{Rails.root}/app/assets/images/link-home-products-540x350.jpg"),
#     products_photo: File.open("#{Rails.root}/app/assets/images/link-footer-products-540x160.jpg")
#   })
# end
#
# if Promotion.count == 0
#   Promotion.create({
#     description: "Offer ends on 31 May 2015.\r\nOffer is valid only for guests who are on their first visit.\r\nYou may enjoy the offer with a friend or reserve the second treatment for your next visit.\r\nAll treatments must be utilised within 8 weeks from the first visit.",
#     photo: File.open("#{Rails.root}/app/assets/images/promotion-promotion1-730x350.jpg"),
#     promotion_url: "/contact-us"
#   })
#
#   Promotion.create({
#     description: "Offer ends on 31 May 2015.\r\nNo minimum purchase on products required.\r\n$25 instant rebate must be enjoyed on the same visit as the purchase.\r\nRebate is not exchangeable for cash or treatment.",
#     photo: File.open("#{Rails.root}/app/assets/images/promotion-promotion2-730x350.jpg"),
#     promotion_url: "/products"
#   })
# end
#
# if News.count == 0
#   @raw_articles = {
#     "airnutrients" => {
#       :title => "AirNutrients&trade;",
#       :content => ["Developed by Sample scientists, AirNutrients&trade; is the micro-infusion of proprietary activated serums and essences onto skin. To fully harness the capability of this superior delivery method, Sample created Bird’s Nest Micro-Essence and AteloCollagen by extracting a high concentration of active bio- compounds from the purest sources with its exclusive extraction technology. With the AirNutrients&trade; technology, the skin benefits much more from treatment products than traditional hand application and massage, as active ingredients can fully penetrate and be completely absorbed by skin.", "All Sample in-studio treatments include AirNutrients&trade;, at absolutely no extra charge, so that your skin remains glowing day after day."],
#       :subtitle => "A new and better way to reap skin care benefits",
#       :image => "img-tipsnews-airnutrients.jpg"
#     },
#     "bird-s-nest-micro-essence" => {
#       :title => "Bird’s Nest Micro-Essence",
#       :subtitle => "",
#       :content => ["Edible bird’s nest, a highly coveted delicacy and health food in Chinese communities, has been traditionally used as part of Traditional Chinese Medicine (TCM) to treat diseases, promote overall immunity and as a beauty supplement to maintain youthfulness and enhance the complexion.", "With advanced technology, edible bird’s nest extracts are now used as chief ingredients in many products that are used for medicinal purposes. Scientific evidence has shown that its efficacy as an anti-ageing agent is attributed to its unique properties that promote cell regeneration aiding in skin repair. With its exclusive extraction technology, Sample freshly extracts a high concentration of active ingredients for the Bird’s Nest Micro-Essence used in all its in-studio treatments, delivering immediate visible results of brighter, glowing skin."],
#       :image => "img-tipsnews-birdsnest.jpg"
#     },
#     "atelocollagen" => {
#       :title => "AteloCollagen",
#       :subtitle => "",
#       :content => ["The presence of collagen in our skin (our skin is made up of about 75 per cent of collagen) determines the condition of our skin – this is what makes our skin supple, firm and smooth. Production of collagen is influenced by the environment and when we age, it slows down or breaks down, resulting in signs of ageing such as sagging skin and appearance of wrinkles.", "AteloCollagen as a soluble form of collagen works as a hydrating agent by holding in moisture, making it valuable for its anti-aging abilities. It also has capabilities of softening and diminishing the appearance of fine lines and wrinkles. AteloCollagen is an effective delivery agent for proteins and other nutrients, and being biodegradable, is used in a variety of fields such as medicine and in medical devices. The AteloCollagen used in Sample products comes from pure marine sources, and is activated through the AirNutrients&trade; technology in every in-studio treatment. After treatment, skin feels and looks firmer, more lifted and contoured immediately."],
#       :image => "img-tipsnews-atelocollagen.jpg"
#     },
#     "the-new-miracle-ingredient" => {
#       :title => "The New Miracle Ingredient",
#       :content => ["The miraculous results of using snail secretion filtrate have shown significant improvement in skin elasticity and regeneration, making it the darling in not skin care products. The results are smooth and hydrated skin that maintains its youthful looking condition. The benefits of this new miracle ingredient can be found in Sample Vitamin B5 Serum.", "Snail secretion filtrate contains natural acids and elastin, substances which promote healing, protect the skin from damage and also improve its appearance. The extract is valued for its ability to have healing effects from acne scarring and pigmentation. Application of skin products with this extract has shown significant reduction of fine lines and wrinkles. A 2013 study reported significant improvement in skin elasticity besides improving dryness and roughness of skin of its participants.", "It is believed that because the structure of the snail skin is similar to the human skin, proteins and nutrients in the filtrate penetrate the skin easily, resulting in positive effect on skin renewal and skin regeneration. Contributing to its healing properties are Glycoconjugates, a compound that is naturally made of proteins, peptides, anti-inflammatories and antioxidants, which are substances that laboratories have not been able to replicate. Glycoconjugates, produced by the body, promote cell regeneration, assist skin repair and eliminate pathogens or micro-organisms. The filtrate also contains a significant amount of Allantoin which stimulates cell regeneration besides soothing irritated skin and moisturises even the driest skin.", "Other compounds found in the secretion include elastin, collagen and glycolic acids, all of which stimulate renewal and repair of the skin. Glycolic acids help in the elimination of dead cells and regeneration of cells. It also stimulates production of collagen which makes the skin thicker and prevents dehydration. The collagen and elastin in the secretion also give our skin its bounce and improve appearance by significantly reducing wrinkles, resulting in supple and smoother skin."],
#       :subtitle => "The slimy but super natural ingredient for thirsty, overworked skin – Snail Secretion Filtrate.
#       ",
#       :image => "img-tipsnews-snail.jpg"
#     }
#   }
#
#   @raw_articles.each do |key, article|
#     news = News.create({
#       title: article[:title],
#       sub_title: article[:subtitle],
#       content: article[:content][0],
#       photo: File.open("#{Rails.root}/app/assets/images/#{article[:image]}")
#     })
#   end
# end
#
# if Product.count == 0
#   @raw_products = {
#     "Cleanser" => [
#       { :name => "Collagen Milk Cleanser",
#         :content => "Gently removes makeup and impurities without stripping skin of its natural moisture while firming skin with its advanced collagen formula.",
#         :image => "Cleanser-CollagenMilkCleanser.png",
#         :id => "collagen-milk-cleanser",
#         :price => "48"
#       },
#       { :name => "Brightening Enzyme Wash",
#         :content => "Gentle enough for daily use, this wash contains Papaya Enzyme and Coenzyme Q10 to help unclog pores and remove dead skin cells. Alternate it with your regular cleanser for a softer, brighter and glowing complexion.",
#         :image => "Cleanser-BrighteningEnzymeWash.png",
#         :id => "brightening-enzyme-wash",
#         :price => "30"
#       },
#       { :name => "Acne Cleanser",
#         :content => "An effective cleansing gel that deep cleanses to remove debris, impurities and surface oil. Its advanced formula unclogs pores, reduces bacterial levels and exfoliates to reveal clearer and healthier skin on face, chest and back. For oily and acne prone skin.",
#         :image => "Cleanser-AcneCleanser.png",
#         :id => "acne-cleanser",
#         :price => "48"
#       }
#     ],
#     "Moisturiser" => [
#       { :name => "Collagen Hydrating Lotion",
#         :content => "A refreshing toning lotion that restores moisture and suppleness to skin and prepares it to receive the benefits of follow on skin care. The advanced collagen formula improves skin firmness and elasticity.",
#         :image => "Moisturiser-CollagenHydratingLotion.png",
#         :id => "collagen-hydrating-lotion",
#         :price => "30"
#       },
#       { :name => "Skin Energising Cream",
#         :content => "This cream rejuvenates and energises dull and tired skin. Enriched with Vitamin C and Coenzyme Q10, these powerful antioxidants strengthen skin and help it regain its natural radiance and luminosity.",
#         :image => "Moisturiser-SkinEnergisingCream.png",
#         :id => "skin-energising-cream",
#         :price => "62"
#       },
#       { :name => "Youth Transform Cream",
#         :content => "Inspired by a Nobel Prize discovery of telomeres, this ultra luxurious treatment is super-charged with Telo-Enhancing™ using exclusive Sample technology to revitalise skin from deep within. It bolsters skin’s natural restorative mechanism and fights against environmental stressors that cause premature ageing. A powerful blend of Rice, Pomegranate and Resveratrol transforms skin to look younger, brighter and firmer.",
#         :image => "Moisturiser-YouthTransformCream.png",
#         :id => "youth-transform-cream",
#         :price => "80"
#       },
#       { :name => "Oil Free Moisturiser",
#         :content => "Formulated to counteract the presence of comedones, papules and pustules, this moisturiser is also bolstered with Hyaluronic Acid for superb hydration. Skin visibly increases in smoothness and suppleness. For oily and acne prone skin.",
#         :image => "Moisturiser-OilFreeMoisturiser.png",
#         :id => "oil-free-moisturiser",
#         :price => "62"
#       }
#
#     ],
#     "Serum" => [
#       { :name => "Vitamin B5 Serum",
#         :content => "Enriched with Vitamin B5 known to help tissue repair, this fast absorbing, oil and dye free, non-fragranced serum contains Hyaluronic Acid and Snail Secretion Filtrate to moisturise and replenish nutrients the skin needs to feel smooth and appear younger.",
#         :image => "Serum-VitaminB5Serum.png",
#         :id => "vitamin-b5-serum",
#         :price => "60"
#       },
#       { :name => "Dewrinkle Serum",
#         :content => "The ultimate in age-defying treatment, this high performing serum works by strengthening the micro-structure of skin. The appearance of deep lines is visibly reduced with enriched proteins that improve skin elasticity and hydration. Skin evolves to reveal a plumper, softer and more relaxed complexion.",
#         :image => "Serum-DewrinkleSerum.png",
#         :id => "dewrinkle-serum",
#         :price => "120"
#       },
#       { :name => "Caviar Booster Essence",
#         :content => "A potent blend of Caviar Extract and Neuropeptide infuses the skin with an extra boost of essential nutrients to further improve skin hydration, elasticity and firmness. Supplement your skin care with this booster for enhanced skin rejuvenation.",
#         :image => "Serum-CaviarBoosterEssence.png",
#         :id => "caviar-booster-essence",
#         :price => "80"
#       }
#     ],
#     "Mask" => [
#       { :name => "Soothing Black Tea Mask",
#         :content => "This high performance mask combines the hydrating properties of Sweet Black Tea Extract and Sodium Hyaluronate to revitalise skin. Yeast Extract reinforces and heals skin, and prevents further damage. Appearance of lines is diminished and skin is invigorated.",
#         :image => "Mask-SoothingBlackTeaMask.png",
#         :id => "soothing-black-tea-mask",
#         :price => "60"
#       },
#       { :name => "Peptide Renewal Mask",
#         :content => "This ultra refreshing mask hydrates, deeply invigorates skin tissues, calms irritation and alleviates tension. The cooling sensation liberates distressed skin from the discomfort of inflammation or dryness.",
#         :image => "Mask-PeptideRenewalMask.png",
#         :id => "peptide-renewal-mask",
#         :price => "70"
#       },
#       { :name => "Caviar Rejuvenation Mask",
#         :content => "Enriched with the goodness of caviar, this ultra luxurious mask provides all the nutrients essential to preserve skin youthfulness. Neuropeptide helps to increase the production of collagen and repair skin cells. For dry and matured skin.",
#         :image => "Mask-CaviarRejuvenationMask.png",
#         :id => "caviar-rejuvenation-mask",
#         :price => "75"
#       },
#       { :name => "Sulphur Purifying Mask",
#         :content => "The anti-inflammatory properties of Sulphur combined with Aloe Vera and purified clay work to manage oily skin and prevent clogged pores. It reduces severe acne blemishes, helps skin to heal and prevents new acne pimples with frequent use. For oily and acne prone skin.",
#         :image => "Mask-SulphurPurifyingMask.png",
#         :id => "sulphur-purifying-mask",
#         :price => "60"
#       }
#
#     ],
#     "Sunscreen And Treatment" => [
#       { :name => "Daily Sun Protection <br/>SPF100++ <br/>Broad Spectrum",
#         :content => "More than sun protection, this ultra light, fast absorbing sunblock has added powerful antioxidants to help defend skin cells. Its breakthrough technology shields against UVA and UVB rays with SPF100++ broad spectrum and protects your skin even at the cellular level.",
#         :image => "SunscreenTreatment-DailySunProtection.png",
#         :id => "daily-sun-protection-spf100-broad-spectrum",
#         :price => "60"
#       },
#       { :name => "Acne Treatment Solution",
#         :content => "This exclusive and powerful formula quickly counteracts comedones and inflammatory lesions such as papules and pustules. Working at the source, it treats and prevents acne formation effectively.",
#         :image => "SunscreenTreatment-AcneTreatmentSolution.png",
#         :id => "acne-treatment-solution",
#         :price => "65"
#       }
#     ]
#   }
#
#   most_popular_product_names = ['Brightening Enzyme Wash', 'Vitamin B5 Serum', 'Daily Sun Protection <br/>SPF100++ <br/>Broad Spectrum']
#
#   highly_recommended_product_names = ['Skin Energising Cream', 'Dewrinkle Serum', 'Caviar Rejuvenation Mask']
#   @raw_products.each do |category, raw_products|
#     raw_products.each do |raw_product|
#       p = Product.create({
#         title: raw_product[:name],
#         description: raw_product[:content],
#         category: category,
#         price: raw_product[:price],
#         photo: File.open("#{Rails.root}/app/assets/images/#{raw_product[:image]}"),
#         most_popular: most_popular_product_names.index(raw_product[:name]).present?,
#         highly_recommended: highly_recommended_product_names.index(raw_product[:name]).present?
#       })
#     end
#   end
# end
#
# if TreatmentPage.count == 0
#   treatment_page = TreatmentPage.create({
#     section_1_header: "AirNutrients&trade;<br/>A Sample Signature",
#     section_1_sub_header: "Infuse your skin with a superfine mist of <b>Bird’s Nest Micro-Essence</b> and <b>AteloCollagen</b>.",
#     section_1_content: "The high concentration of active ingredients is extracted from the purest sources with Sample exclusive technology. <i>AirNutrients</i>&trade; enhance the treatment outcome and help your skin look brighter and firmer longer.\r\n\r\nAll Sample treatments include <i>AirNutrients</i>&trade; at no extra charge so that you stay positively glowing day after day.",
#     section_1_cfa_title: "See treatments",
#     section_1_cfa_url: "/treatments#treat",
#     section_1_learn_more_title: "Learn more",
#     section_1_learn_more_url: "/tips-news",
#     section_1_background: File.open("#{Rails.root}/data/images/bg-airnutrients.jpg"),
#     section_2_header: "Science-based treatments,<br/>goal-oriented skin care outcome",
#     section_2_sub_header: "Do you slather on potions and lotions to achieve a flawless complexion? Or are you comfortable in your own skin and just want to age gracefully?",
#     section_2_content: "Whatever your skin care goal, depending on your lifestyle and skin condition, Sample has curated an advanced collection of safe and efficient technologies. Matched with concentrated clinical grade products derived from precious natural ingredients, effective treatments are designed and combined to attain your desired skin care outcome.",
#     section_2_background: File.open("#{Rails.root}/data/images/bg-treatments.jpg"),
#     section_3_header: "Which Lifestyle Icon best describes you?",
#     section_3_sub_header: "Are you a working parent balancing career and family? Do you travel often for work and leisure? Are you enjoying K-drama series late into the night several times a week?",
#     section_3_content: "You lead a full life, looking good should fit into your way of life effortlessly, and yet be attained quickly but effectively. Whether you are busy as a bee because of the demands of work, or aim to lead a fuss-free lifestyle, Sample matches its science-based treatments and products to your lifestyle to achieve the outcome of your skin care goals.",
#     section_3_footer: "To find out more about skin care personalised by lifestyle,",
#     section_3_cfa_url: "/contact-us",
#     section_3_cfa_title: "Visit our studio",
#     section_3_support_photo: File.open("#{Rails.root}/data/images/img-lifestyle-icon.jpg"),
#   })
#
#   treatment_1 = Treatment.create({
#     title: 'Deep Cleanse & Revitalise',
#     content: "This treatment uses ultrasound to unclog skin pores painlessly, and the latest microdermabrasion technology to refine skin texture and infuse activated nutrient-rich serums to nourish skin. Regular sessions help to maintain a radiant, age-defied complexion.\r\n\r\nRecommended for Busy Bee, Minimalist, Road Warrior, Night Owl and Beauty Junkie.",
#     treatment_page: treatment_page
#   })
#
#   treatment_2 = Treatment.create({
#     title: 'Lighten & Refine',
#     content: "The Deep Cleanse & Revitalise therapy is enhanced to lighten scars and blemishes, unclog pores and reduce pore size. The latest microdermabrasion technology refines skin texture and infuses activated nutrient-rich serums to nourish skin. Regular sessions help to achieve an overall lightening effect and promote healthy skin.\r\n\r\nRecommended for Active Panther (with scars and blemishes concerns).",
#     treatment_page: treatment_page
#   })
#
#   treatment_3 = Treatment.create({
#     title: 'Firm & Lift',
#     content: "This New Generation Radio Frequency treatment helps to regenerate collagen fibres in the dermis layer. The heating of fat cells accelerates metabolism resulting in a more sculpted contour. Combined with the infusion of activated nutrient-rich serums, this treatment helps to reduce fine lines without causing damage. Firmer, younger looking skin is immediately visible after the treatment. Regular sessions support continuous collagen regeneration and promote even longer lasting results.\r\n\r\nRecommended for Busy Bee, Minimalist, Road Warrior, Night Owl and Beauty Junkie.",
#     treatment_page: treatment_page
#   })
#
#   treatment_4 = Treatment.create({
#     title: ' OxyRenew Anti-Ageing',
#     content: "This 3-in-1 treatment includes gentle removal of dead skin cells followed by an infusion of activated nutrient-rich serums into skin that helps to diminish the appearance of fine lines and wrinkles. It ends with the ultra-luxurious Caviar Rejuvenation Mask that has been specially formulated with Neuropeptide to increase the production of collagen, repair skin cells and restore youthfulness.\r\n\r\nRecommended for Road Warrior, Night Owl and Beauty Junkie.",
#     treatment_page: treatment_page
#   })
#
#   treatment_5 = Treatment.create({
#     title: 'OxyBright Anti-Spots',
#     content: "This treatment starts with gentle removal of dead skin cells followed by a cocktail of serums that includes Vitamin C, Kojic Acid, Azelaic Acid and Retinol which helps to increase skin hydration, inhibit melanin production, kill bacteria and promote skin cell renewal. It ends with a brightening mask that contains plant extracts to provide intense moisture, and lighten pigmentation to reveal a luminous complexion.\r\n\r\nRecommended for Busy Bee and Beauty Junkie.",
#     treatment_page: treatment_page
#   })
#
#   treatment_6 = Treatment.create({
#     title: 'OxyBright Healing',
#     content: "This treatment combines the latest Tri-NewGen Radio Frequency technology with gentle removal of dead skin cells, and a Tea Tree Mask to decongest and detoxify skin. This treatment targets acne and supports skin healing, so that skin evolves to be softer and smoother.\r\n\r\nRecommended for Active Panther (with acne concerns).",
#     treatment_page: treatment_page
#   })
#
#   treatment_7 = Treatment.create({
#     title: 'Purify & Rejuvenate',
#     content: "This treatment is formulated to unclog pores, keep skin healthy and balanced. For teens with comedones or acne, the Sulphur Purifying Mask helps to kill acne that causes bacteria accumulation, as well as to reduce inflammation and support the rejuvenation of skin cells.\r\n\r\nRecommended for young Active Panther.",
#     treatment_page: treatment_page
#   })
# end
#
# if StaticPage.count == 0
#   StaticPage.create({
#     code: 'terms_of_use',
#     content: %Q{
#       <h3>Terms of Use</h3>
#       <table cellspacing="0" cellpadding="0" border="0" width="100%"><tbody><tr><td width="480"><p data-crescent="as-1cft4E">LAST UPDATED: <span class="editable clickover" name="dateOfAgreement"><abbr>12th day of March 2015</abbr></span><br></p></td></tr></tbody></table>
#   <table cellspacing="0" cellpadding="0" border="0" width="100%">
#   <tbody><tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 24px;" width="24">1.</td>
#   <td width="456">
#   <p data-crescent="as-2AnkPf"><strong>ACCEPTANCE OF TERMS</strong></p>
#   <table cellspacing="0" cellpadding="0" border="0" width="100%">
#   <tbody><tr>
#   <td style="vertical-align: top; padding-top: 15px;" width="23">1.1</td>
#   <td width="428"><p data-crescent="as-3cCukZ">We are <span class="editable clickover empty-editable" name="fullCompanyName"><abbr>Sample Pte Ltd</abbr></span> and we own and operate this website (“Site”) at <span class="editable clickover empty-editable" name="webURL"><abbr><a href="http://www.sampleapp.com.sg" style="font-size: 16px;">sampleapp.com.sg</a></abbr></span>.<br></p></td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px;" width="23">1.2</td>
#   <td width="428"><p data-crescent="as-4hyG3Z">Your use of this Site is subject to these Terms of Use. By using the Site, you are deemed to have accepted and agree to be bound by these Terms of Use. We may make changes to these Terms of Use from time to time. We may notify you of such changes by any reasonable means, including by posting the revised version of these Terms of Use on the Site. Your use of the Site following changes to these Terms of Use will constitute your acceptance of those changes.<br></p></td>
#   </tr>
#   </tbody></table>
#   </td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 24px;" width="24">2.</td>
#   <td width="456">
#   <p data-crescent="as-5zGTXD"><strong>ABILITY TO ACCEPT TERMS OF USE</strong></p>
#   <table cellspacing="0" cellpadding="0" border="0" width="100%"><tbody><tr>
#   <td style="vertical-align: top; padding-top: 15px;" width="23">2.1</td>
#   <td width="428"><p data-crescent="as-6B6xax">You affirm that you are either more than 18 years of age, or possess legal parental or guardian consent, and are fully able and competent to enter into the terms, conditions, obligations, affirmations, representations, and warranties set forth in these Terms of Use, and to abide by and comply with these Terms of Use.<br></p></td>
#   </tr></tbody></table>
#   </td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 24px;" width="24">3.</td>
#   <td width="456">
#   <p data-crescent="as-7fcCz6"><strong>SITE ACCESS</strong></p>
#   <table cellspacing="0" cellpadding="0" border="0" width="100%">
#   <tbody><tr>
#   <td style="vertical-align: top; padding-top: 15px;" width="23">3.1</td>
#   <td width="428"><p data-crescent="as-87ZihF">You are responsible for all access to the Site using your internet connection, even if the access is by another person.<br></p></td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px;" width="23">3.2</td>
#   <td width="428"><p data-crescent="as-9nj9Iu">We will use reasonable efforts to ensure that the Site is available at all times. However, we cannot guarantee that the Site or any individual function or feature of the Site will always be available and/or error free. The Site may be unavailable during periods when we are implementing upgrades or carrying our essential maintenance on the Site.<br></p></td>
#   </tr>
#   </tbody></table>
#   </td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 24px;" width="24">4.</td>
#   <td width="456">
#   <p data-crescent="as-10XQStI"><strong>ACCESS TO SITE OUTSIDE OF SINGAPORE</strong></p>
#   <table cellspacing="0" cellpadding="0" border="0" width="100%"><tbody><tr>
#   <td style="vertical-align: top; padding-top: 15px;" width="23">4.1</td>
#   <td width="428"><p data-crescent="as-11ISfrF">We make no promise that the materials on the Site are appropriate or available for use in locations outside Singapore. Accessing the Site from territories where its contents are illegal or unlawful is prohibited. If you choose to access the Site from elsewhere, you do so on your own initiative and are responsible for compliance with local laws.<br></p></td>
#   </tr></tbody></table>
#   </td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 24px;" width="24">5.</td>
#   <td width="456">
#   <p data-crescent="as-12JTB7T"><strong>YOUR USE OF THE SITE</strong></p>
#   <table cellspacing="0" cellpadding="0" border="0" width="100%">
#   <tbody><tr>
#   <td style="vertical-align: top; padding-top: 15px;" width="23">5.1</td>
#   <td width="428">
#   <p data-crescent="as-13YcVqB">Your permission to use the Site is personal to you and non-transferable, and you may not use the Site for commercial purposes. Your use of the Site is conditional on your compliance with the rules of conduct set forth in these Terms of Use and you agree that you will not:</p>
#   <table cellspacing="0" cellpadding="0" border="0" width="100%">
#   <tbody><tr>
#   <td style="width: 42px;" width="42">5.1.1</td>
#   <td width="381"><p data-crescent="as-14RnrZv">Use the Site for any fraudulent or unlawful purpose;<br></p></td>
#   </tr>
#   <tr>
#   <td style="width: 42px;" width="42">5.1.2</td>
#   <td width="381"><p data-crescent="as-15WdEUL">Use the Site to defame, abuse, harass, stalk, threaten or otherwise violate the rights of others, including without limitation others’ privacy rights or rights of publicity;<br></p></td>
#   </tr>
#   <tr>
#   <td style="width: 42px;" width="42">5.1.3</td>
#   <td width="381"><p data-crescent="as-16YHrH2">Impersonate any person or entity, false state or otherwise misrepresent your affliation with any person or entity in connection with the Site or express or imply that we endorse any statement you make;<br></p></td>
#   </tr>
#   <tr>
#   <td style="width: 42px;" width="42">5.1.4</td>
#   <td width="381"><p data-crescent="as-171fJ7x">Interfere with or disrupt the operation of the Site or the servers or networks used to make the Site available or violate any requirements, procedures, policies or regulations of such networks;<br></p></td>
#   </tr>
#   <tr>
#   <td style="width: 42px;" width="42">5.1.5</td>
#   <td width="381"><p data-crescent="as-18fFgHB">Transmit or otherwise make available in connection with the Site any virus, worm or other computer code that is harmful or invasive or may or is intended to damage the operation of, or to monitor the use of, any hardware, software, or equipment;<br></p></td>
#   </tr>
#   <tr>
#   <td style="width: 42px;" width="42">5.1.6</td>
#   <td width="381"><p data-crescent="as-19ZvEKM">Reproduce, duplicate, copy, sell, resell or otherwise exploit for any commercial purposes, any portion of, use of, or access to the Site;<br></p></td>
#   </tr>
#   <tr>
#   <td style="width: 42px;" width="42">5.1.7</td>
#   <td width="381"><p data-crescent="as-206r1mh">Modify, adapt, translate, reverse engineer, decompile or disassemble any portion of the Site. If you wish to reverse engineer any part of the Site to create an interoperable program you must contact us and we may provide interface data subject to verification of your identity and other information;<br></p></td>
#   </tr>
#   <tr>
#   <td style="width: 42px;" width="42">5.1.8</td>
#   <td width="381"><p data-crescent="as-21l0lPT">Remove any copyright, trade mark or other proprietary rights notice from the Site or materials originating from the Site;<br></p></td>
#   </tr>
#   <tr>
#   <td style="width: 42px;" width="42">5.1.9</td>
#   <td width="381"><p data-crescent="as-22WEreb">Frame or mirror any part of the Site without our express prior written consent;<br></p></td>
#   </tr>
#   <tr>
#   <td style="width: 42px;" width="42">5.1.10</td>
#   <td width="381"><p data-crescent="as-23i6gS2">Create a database by systematically downloading and storing Site content;<br></p></td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 42px;" width="42">5.1.11</td>
#   <td width="381"><p data-crescent="as-24DYxJv">Use any manual or automatic device in any way to gather Site content or reproduce or circumvent the navigational structure or presentation of the Site without our express prior written consent. Notwithstanding the foregoing, we grant the operators of public online search engines limited permission to use search retrieval applications to reproduce materials from the Site for the sole purpose of and solely to the extent necessary for creating publicly available searchable indices of such materials solely in connection with each operator's public online search service.<br></p></td>
#   </tr>
#   </tbody></table>
#   </td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px;" width="23">5.2</td>
#   <td width="428"><p data-crescent="as-25ZyRt0">We reserve the right to revoke these exceptions either generally or in specific instances.<br></p></td>
#   </tr>
#   </tbody></table>
#   </td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 24px;" width="24">6.</td>
#   <td width="456">
#   <p data-crescent="as-26torjB"><strong>THIRD PARTY WEBSITES</strong></p>
#   <table cellspacing="0" cellpadding="0" border="0" width="100%">
#   <tbody><tr>
#   <td style="vertical-align: top; padding-top: 15px;" width="23">6.1</td>
#   <td width="428"><p data-crescent="as-27zvAKa">The Site may provide links to other websites and online resources. We are not responsible for and do not endorse such external sites or resources. Your use of third party websites and resources is at your own risk.<br></p></td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px;" width="23">6.2</td>
#   <td width="428">
#   <p data-crescent="as-28kxEBB">You may create a link to this Site, provided that:</p>
#   <table cellspacing="0" cellpadding="0" border="0" width="100%">
#   <tbody><tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 34px;" width="34">6.2.1</td>
#   <td width="389">
#   <p data-crescent="as-29GKxMs">The link is fair and legal and is not presented in a way that is:</p>
#   <table cellspacing="0" cellpadding="0" border="0" width="100%">
#   <tbody><tr>
#   <td style="width: 21px;" width="21">(a)</td>
#   <td width="363"><p data-crescent="as-30oghMP">Misleading or could suggest any type of association, approval or endorsement by us that does not exist, or<br></p></td>
#   </tr>
#   <tr>
#   <td style="width: 21px;" width="21">(b)</td>
#   <td width="363"><p data-crescent="as-31CBejU">Harmful to our reputation or the reputation of any of our affiliates;<br></p></td>
#   </tr>
#   </tbody></table>
#   </td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 34px;" width="34">6.2.2</td>
#   <td width="389"><p data-crescent="as-32eD0vN">You retain the legal right and technical ability to immediately remove the link at any time, following a request by us to do so.<br></p></td>
#   </tr>
#   </tbody></table>
#   </td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px;" width="23">6.3</td>
#   <td width="428"><p data-crescent="as-33AV92v">We reserve the right to require you to immediately remove any link to the Site at any time and you shall immediately comply with any request by us to remove any such link.<br></p></td>
#   </tr>
#   </tbody></table>
#   </td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 24px;" width="24">7.</td>
#   <td width="456">
#   <p data-crescent="as-349bSDD"><strong>INTELLECTUAL PROPERTY</strong></p>
#   <table cellspacing="0" cellpadding="0" border="0" width="100%"><tbody><tr>
#   <td style="vertical-align: top; padding-top: 15px;" width="23">7.1</td>
#   <td width="428"><p data-crescent="as-35k0dHM">The intellectual property rights in the Site and all of the text, pictures, videos, graphics, user interfaces, visual interfaces, trademarks, logos, applications, programs, computer code and other content made available on it are owned by us and our licensors. You may not print or otherwise make copies of any such content without our express prior permission<br></p></td>
#   </tr></tbody></table>
#   </td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 24px;" width="24">8.</td>
#   <td width="456">
#   <p data-crescent="as-36wWSDy"><strong>LIMITATION OF LIABILITY</strong></p>
#   <table cellspacing="0" cellpadding="0" border="0" width="100%">
#   <tbody><tr>
#   <td style="vertical-align: top; padding-top: 15px;" width="23">8.1</td>
#   <td width="428">
#   <p data-crescent="as-37x71Cg">We provide the Site on an “as is” basis and make no representations as to the quality, completeness or accuracy of any content made available on the Site. To the maximum extent permitted by law, we expressly exclude:</p>
#   <table cellspacing="0" cellpadding="0" border="0" width="100%">
#   <tbody><tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 34px;" width="34">8.1.1</td>
#   <td width="389"><p data-crescent="as-38KHJJ3">All conditions, warranties and other terms that might otherwise by implied by law into these Terms of Use; and<br></p></td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 34px;" width="34">8.1.2</td>
#   <td width="389"><p data-crescent="as-39maOk3">Any and all liability to you, whether arising under these Terms of Use or otherwise in connection with your use of the Site.<br></p></td>
#   </tr>
#   </tbody></table>
#   </td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px;" width="23">8.2</td>
#   <td width="428"><p data-crescent="as-400j4SM">The foregoing is a comprehensive limitation of liability that applies to all damages of any kind, including (without limitation) compensatory, direct, indirect or consequential damages, loss of data, income or profit, loss of or damage to property and claims of third parties. Notwithstanding the foregoing, nothing in these Terms of Use is intended to exclude or limit any liability that may not by law be excluded or limited, and in particular none of the exclusions and limitations in this clause are intended to limit any rights you may have as a consumer under Singapore law or statutory rights which may not be excluded, nor in any way to exclude or limit (site owner) liability to you for death or personal injury resulting from our negligence or that of our employees or agents.<br></p></td>
#   </tr>
#   </tbody></table>
#   </td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 24px;" width="24">9.</td>
#   <td width="456">
#   <p data-crescent="as-41x4LBB"><strong>COLLECTION OF PERSONAL INFORMATION</strong></p>
#   <table cellspacing="0" cellpadding="0" border="0" width="100%"><tbody><tr>
#   <td style="vertical-align: top; padding-top: 15px;" width="23">9.1</td>
#   <td width="428"><p data-crescent="as-42nXo7r">We may collect and use information about you in accordance with our privacy policy. You can view a copy of this policy by clicking <a href="http://sampleapp.com.sg/privacy" style="font-size: 16px">here</a> <span class="editable clickover empty-editable" name="privacyPolicyURL"><abbr></abbr></span>.<br></p></td>
#   </tr></tbody></table>
#   </td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 24px;" width="24">10.</td>
#   <td width="456">
#   <p data-crescent="as-43NtoDW"><strong>DURATION OF TERMS</strong></p>
#   <table cellspacing="0" cellpadding="0" border="0" width="100%"><tbody><tr>
#   <td style="width: 31px; vertical-align: top; padding-top: 15px;" width="31">10.1</td>
#   <td width="420"><p data-crescent="as-44udt4N">These Terms of Use are effective until terminated. We may, at any time and for any reason, terminate your access to or use of the Site. If we terminate your access to the Site you will not have the right to bring claims against us or our affiliates with respect to such termination. We and our affiliates shall not be liable for any termination of your access to the Site.<br></p></td>
#   </tr></tbody></table>
#   </td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 24px;" width="24">11.</td>
#   <td width="456">
#   <p data-crescent="as-45mfO1q"><strong>GOVERNING LAW</strong></p>
#   <table cellspacing="0" cellpadding="0" border="0" width="100%"><tbody><tr>
#   <td style="width: 31px; vertical-align: top; padding-top: 15px;" width="31">11.1</td>
#   <td width="420"><p data-crescent="as-46G1zAJ">These Terms of Use will be governed by and construed in accordance with the laws of Singapore, and the courts of Singapore will have non-exclusive jurisdiction over any claim or dispute arising under or in connection with these Terms of Use.<br></p></td>
#   </tr></tbody></table>
#   </td>
#   </tr>
#   </tbody></table>
#     }
#   })
#
#   StaticPage.create({
#     code: 'privacy_policy',
#     content: %Q{
#       <h3>Privacy Policy</h3>
#       <table cellspacing="0" cellpadding="0" border="0" width="100%" class="ls">
#   <tbody><tr><td width="480"><p data-crescent="as-1bclc7">LAST UPDATED: <span class="editable clickover" name="dateOfAgreement"><abbr>12th day of March 2015</abbr></span><br></p></td></tr>
#   <tr><td width="480"><p data-crescent="as-25Nhwm"><span class="editable t_hideOnClickOutside clickover" name="fullCompanyName"><abbr>Sample Pte Ltd</abbr></span> (“<span class="editable t_hideOnClickOutside clickover" name="shortformCompanyName"><abbr>Sample”, “we” or “us</abbr></span>”) takes your privacy very seriously. We ask that you read this privacy policy (the “Policy”) carefully as it contains important information about what to expect when <span class="editable clickover" name="shortformCompanyName"><abbr>“Sample”, “we” or “us”</abbr></span> collects personal information about you and how <span class="editable clickover" name="shortformCompanyName"><abbr>“Sample”, “we” or “us”</abbr></span> will use your personal data.<br></p></td></tr>
#   </tbody></table>
#   <table cellspacing="0" cellpadding="0" border="0" width="100%"><tbody><tr><td width="480">
#   <p data-crescent="as-3strXt">This Policy applies to information we collect on <span class="editable clickover empty-editable" name="webURL"><abbr><a href="http://www.sampleapp.com.sg" style="font-size: 16px;">sampleapp.com.sg</a></abbr></span> and its sub-domains about:</p>
#   <table cellspacing="0" cellpadding="0" border="0" width="100%">
#   <tbody><tr>
#   <td style="width: 15px;" width="15">i)</td>
#   <td width="465"><p data-crescent="as-4x7j0q">visitors to our website (the “Site”); and<br></p></td>
#   </tr>
#   <tr>
#   <td style="width: 15px;" width="15">ii)</td>
#   <td width="465"><p data-crescent="as-5lViDo">people who register their emails with us; and<br></p></td>
#   </tr>
#   <tr>
#   <td style="width: 19px;" width="19">iii)</td>
#   <td width="461"><p data-crescent="as-41koyzq">vistors who submit an enquiry with us.<br></p></td>
#   </tr>
#   </tbody></table>
#   </td></tr></tbody></table>
#   <table cellspacing="0" cellpadding="0" border="0" width="100%">
#   <tbody><tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 24px;" width="24">1.</td>
#   <td width="456"><p data-crescent="as-60tsJr"><strong>INFORMATION COLLECTED FROM ALL VISITORS TO OUR WEBSITE</strong> <br><br> We will obtain personal data about you when you visit us. When you visit us, we may monitor the use of this Site through the use of cookies and similar tracking devices. For example, we may monitor the number of times you visit our Site or which pages you go to. This information helps us to build a profile of our users. Some of this data will be aggregated or statistical, which means that we will not be able to identify you individually. Please see further the section on “Our Use of Cookies” below.<br></p></td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 24px;" width="24">2.</td>
#   <td width="456">
#   <p data-crescent="as-72KudM"><strong>INFORMATION COLLECTED FROM USERS WHO REGISTER THEIR EMAILS WITH US</strong> <br><br> When you register your emails with us, we may use it for the following:</p>
#   <table cellspacing="0" cellpadding="0" border="0" width="100%">
#   <tbody><tr>
#   <td style="width: 21px;" width="21">(a)</td>
#   <td width="430"><p data-crescent="as-8r9qyv">will send you weekly newsletters, contact you about products and services we think may be of interest to you.<br></p></td>
#   </tr>
#   <tr>
#   <td style="width: 21px;" width="21">(b)</td>
#   <td width="430"><p data-crescent="as-9DQOUE"><span>describe another activity here.</span><br></p></td>
#   </tr>
#   </tbody></table>
#   <p data-crescent="as-108iBhi">If you agree to us providing you with these information, you can always opt out at a later date. If you would rather not receive these information, please send a blank email message to <span class="editable clickover empty-editable" name="email"><abbr><a href="mailto:contact@sampleapp.com.sg" style="font-size: 16px;">contact@sampleapp.com.sg</a></abbr></span>. <br><br>By submitting your email you consent to the use of that email as set out in this policy.<br></p>
#   </td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 24px;" width="24">3.</td>
#   <td width="456"><p data-crescent="as-11Rs4ZW"><strong>OUR USE OF COOKIES</strong><br><br>Cookies are text files placed on your computer to collect standard Internet log information and visitor behaviour information. The information is used to track visitor use of the Site and to compile statistical reports on Site activity. For further information about cookies visit <a href="http://www.aboutcookies.org" style="font-size: 16px;">www.aboutcookies.org</a> or <a href="http://www.allaboutcookies.org"  style="font-size: 16px;">www.allaboutcookies.org</a>. You can set your browser not to accept cookies and the above websites tell you how to remove cookies from your browser. However, in a few cases some of our Site features may not function if you remove cookies from your browser.<br></p></td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 24px;" width="24">4.</td>
#   <td width="456"><p data-crescent="as-12iZfAz"><strong>HOW WE PROTECT YOUR INFORMATION</strong><br><br>We are committed to maintaining the security of personal information. We strive to maintain the safety of your Personal Information. For example, your Personal Information is transmitted via Secure Socket Layer (SSL) technology and access to your account information requires a password. You must keep your password confidential.<br><br><a href="http://www.sampleapp.com.sg" style="font-size: 16px;">SampleApp.com</a> is hosted on DigitalOcean. More details about DigitalOcean security are available at <a href="https://www.digitalocean.com/security/" style="font-size: 16px;">www.digitalocean.com/security</a>.<br><br>Unfortunately, no internet-based service is completely secure. We cannot guarantee that any confidential or Personal Information you share while using <a href="http://www.sampleapp.com.sg" style="font-size: 16px;">SampleApp.com</a> is maintained at adequate levels of protection to meet your specific needs or obligations. We assume no responsibility for unauthorized access to your Personal Information.<br></p></td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 24px;" width="24">5.</td>
#   <td width="456"><p data-crescent="as-13xs0Sv"><strong>ACCESS TO YOUR INFORMATION AND UPDATING AND CORRECTING YOUR INFORMATION</strong> <br><br>Subject to the exceptions referred to in section 21(2) of the Personal Data Protection Act 2012 (No. 26 of 2012) of Singapore (“PDPA”), you have the right to request a copy of the information that we hold about you. If you would like a copy of some or all of your personal information, please send an email to [email address and link] or send a letter to [name and address]. We may make a small charge for this service. <br><br>We want to ensure that your personal information is accurate and up to date. If any of the information that you have provided to <span class="editable clickover empty-editable" name="shortformCompanyName"><abbr>Sample”, “we” or “us</abbr></span> changes, for example if you change your email address, name or payment details, or if you wish to cancel your registration, please let us know the correct details by sending an email to <span class="editable clickover empty-editable" name="email"><abbr><a href="mailto:contact@sampleapp.com.sg" style="font-size: 16px;">contact@sampleapp.com.sg</a></abbr></span> or by sending a letter to <span class="editable clickover empty-editable" name="contactPerson"><abbr>Sher Min Gasper</abbr></span> at <span class="editable clickover empty-editable" name="contactAddress"><abbr> Sample Studio @ Golden Shoe,&nbsp;50 Market Street,&nbsp;#01-33 Golden Shoe Car Park,&nbsp;Singapore 048940</abbr></span>. You may ask us, or we may ask you, to correct information you or we think is inaccurate, and you may also ask us to remove information which is inaccurate.<br></p></td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 24px;" width="24">6.</td>
#   <td width="456"><p data-crescent="as-14M0u4y"><strong>NON-DISCLOSURE</strong> <br><br>We do not sell, trade, or otherwise transfer to third parties your personally identifiable information.&nbsp; This does not include trusted third parties who assist us in operating our website, conducting our business, or servicing you, as long as these parties agree to keep this information confidential. We may also release your information when we believe release is appropriate to comply with the law, enforce our site policies, or protect ours and others’ rights, property, or safety. However, non-personally identifiable visitor information may be provided to other parties for marketing, advertising, or other uses.<br></p></td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 24px;" width="24">7.</td>
#   <td width="456"><p data-crescent="as-15Pwfug"><strong>LINKS TO OTHER WEBSITES</strong> <br><br>Our Site may contains links to other websites. This privacy policy only applies to this website so when you link to other websites you should read their own privacy policies.<br></p></td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 24px;" width="24">8.</td>
#   <td width="456"><p data-crescent="as-16Jspaz"><strong>SALE OF BUSINESS</strong> <br><br>If <span class="editable clickover empty-editable" name="shortformCompanyName"><abbr>Sample”, “we” or “us</abbr></span>’s business is sold or integrated with another business your details may be disclosed to our advisers and any prospective purchasers and their advisers and will be passed on to the new owners of the business.<br></p></td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 24px;" width="24">9.</td>
#   <td width="456"><p data-crescent="as-17xSRrH"><strong>CHANGES TO PRIVACY POLICY</strong> <br><br>We keep our privacy policy under regular review. If we change our privacy policy we will post the changes on this page, and place notices on other pages of the Site, so that you may be aware of the information we collect and how we use it at all times. This privacy policy was last updated on <span class="editable clickover" name="dateOfAgreement"><abbr>12th day of March 2015</abbr></span>.<br></p></td>
#   </tr>
#   <tr>
#   <td style="vertical-align: top; padding-top: 15px; width: 24px;" width="24">10.</td>
#   <td width="456"><p data-crescent="as-18EzxKZ"><strong>HOW TO CONTACT US</strong><br><br>We welcome your views about our Site and our privacy policy. If you would like to contact us with any queries or comments please send an email to <span class="editable clickover" name="email"><abbr><a href="mailto:contact@sampleapp.com.sg" style="font-size: 16px;">contact@sampleapp.com.sg</a></abbr></span> or send a letter to <span class="editable clickover" name="contactPerson"><abbr>Sher Min Gasper</abbr></span> at <span class="editable clickover t_hideOnClickOutside empty-editable" name="contactAddress"><abbr> <span>Sample Studio @ Golden Shoe,&nbsp;50 Market Street,&nbsp;#01-33 Golden Shoe Car Park,&nbsp;Singapore 048940</span></abbr></span>.<br></p></td>
#   </tr>
#   </tbody></table>
#     }
#   })
#
# end