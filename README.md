# 1Life

1Life is a life-skills social-media learning platform featuring scrollable content, short videos, and incentives to users for inviting their friends to the app by unlocking new features.

## Inspiration

In several countries, life skills like filing taxes, cooking, and doing house chores are taught in school curriculums, but the U.S. education system often leaves out this essential education. Meanwhile, younger generations are growing up in a fast-paced digital world and consequently, have short attention spans and consume content in short form (TikTok and Instagram Reels). **How might we motivate young adults to learn life skills in a way that engages them in this fast-paced digital world?**

## What it does

1Life combines addictive engagements of popular social media apps(Beli's friend activity sharing and Instagram's navigation tab layout) and learning life skills content to appeal to Gen Z who are used to seeing content in reels. The app also incentivizes users to attract more people to the app by unlocking new perks that would normally be held behind a subscription or paywall such as privacy mode when inviting a certain amount of new users. By incorporating social incentives into the platform, 1Life encourages app growth and ongoing user engagement.

## How we built it

- Frontend: Built with **Swift in Xcode** for a native iOS experience.
- Design: Prototyped and styled using **Figma** to ensure a clean, familiar UX inspired by Instagram and Pinterest.
- Backend: Developed in **TypeScript**. We use:
     - **AWS S3** to store video content
     - **MongoDB** for managing user data and metadata
     - Originally deployed via Render, but due to deployment issues, we switched to **Google Cloud VM** 
        for a more reliable setup.

## Challenges we ran into

- UI components didn’t always behave as expected during user interaction testing.
- Several frontend bugs delayed integration with backend features.
- Render.com deployment issues led us to pivot deployment strategies mid-project.
- Balancing big ideas (like AR integration) with time constraints and technical feasibility.

## Accomplishments that we're proud of

- Built an intuitive UI that feels familiar to social media users.
- Successfully launched a working MVP with real backend functionality.
- Integrated AWS and MongoDB to handle real video and user data.
- Stayed adaptable and focused under tight deadlines.

## What we learned

- How to blend the addictive UX of social platforms with meaningful, educational content.
- The importance of scoping and time management, especially in a team setting.
- How to play to each team member’s strengths while supporting each other’s learning curves.
- That falling in love with the problem (not the solution) is what really drives innovation.

## What's next for 1Life

- OAuth integration for seamless user login and data syncing
- Personalized profiles and skill-based content recommendations
- Gamified learning streaks and badges
- Launching beta tests with a target Gen Z user base
- Marketing through platforms like TikTok and Instagram
- Seeking sponsorships or partnerships with organizations promoting life skills, education, or youth 
   empowerment

