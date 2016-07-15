# Murder Mystery Game

## Synopsis
You're a police detective in a city and have been tasked with solving the recent murder of an important person. You need to investigate locations to determine where the murder happened and what weapon was used, and interview witnesses to determine which of the suspects is guilty. After conducting your investigation you need to submit a report to the police commissioner who will act appropriately based on your findings.

## Win Condition
Your report leads to the arrest and conviction of the correct person:

1. You identify the correct suspect   
2. You identify the correct murder weapon
3. You identify the correct location of the murder

The game will only result in a win if all three of the conditions above are fulfilled. Otherwise, the game will result in a loss with the losing scenario determinate on what the player got wrong.

## Lose Conditions
The player will lose the game if the above three conditions aren't met. Specific scenarios occur based on what the player got wrong:

1. The incorrect suspect is identified
2. The incorrect murder weapon is identified
3. The incorrect murder location is identified

**If the player got none of the conditions correct** the murder remains unsolved. The player loses their job, and the amount of publicity surrounding the murder of a high-profile individual and the botched trial lead to a string of copycat killings upon others. The killer remains at large.

**If the player got one of three conditions correct** the murder remains unsolved. The player's reputation is damaged by negative public opinion and are demoted to the Arson desk where they spend the rest of the career investigating house fires. The subsequent manhunt for the killer, who remains at large, causes civil unrest and disobedience due to the strict emergency powers enacted by the city council and the increased police presence on the streets.

**If the player got two of the three conditions correct** the indicted suspect is trialled and found guilty in a kangaroo court to satisfy the public's demands for justice. The player is hailed a hero by the press and public, but their career is irreparably damaged because of their inability to solve the case and is never again assigned to any major case. Many conspiracy theories emerge surrounding the murder and trial and it becomes a popular subject in media and culture for years. The lives of some innocent people are ruined because they become the target of various conspiracy theories.

## Gameplay
The game is a text-based adventure. Interactions are driven by paragraphs describing scenarios and menus for performing actions. When the game starts, the following actions happen to generate a crime:

1. The murder victim is picked from a list of possible candidates.
2. The murder weapon is picked from a list of potential weapons.
2. The scene of the crime is picked from a list of possible locations.
  - Each location has a witness, whose dialogue changes depending on if the murder took place at the location.
3. The murderer is picked from a list of suspects.

### Victims
| Name           | Occupation    | Reason for Murder |
| :------------- | :------------- | :------------- |
| Grayson Irving | City Mayor | Allegations of corruption
| Innes McCracken | Shadow Foreign Secretary | Pro-immigration campaigner
| Ruldoph Buchanan | Director of an international conglomerate | Knowingly employs child labour
| Ramona Blackbourne | Prominent Journalist | Supporting numerous high-profile whistleblowers
| Russell Matthews | Olympic Athlete | Prominent human rights campaigner
| Lillian Bush | Celebrity Socialite | Squanders money and holds extreme political views
| Keenan Moloney | Police Officer | Previously shot and killed a suspect
| Theo Adamson | Prime Minister's Aide | Openly transgender

### Suspects
| Name           | Motivation   
| :------------- | :-------------
| Herman Ellery | Convert to Islamic Extremism
| Ranald Pottinger | Professional hitman
| Stuart York | Gang member
| Winton Snider | Career criminal
| Gwyn Mallory | Foreign spy
| Emmaline Pitts | Violent anarchist

### Locations and Witnesses
| Location | Witness |
| :----- | :------ |
| Hotel | Doorman
| Bar | Bartender
| Back Alley | Homeless man
| Soho | Prostitute
| Offices | Concierge |
| Shop | Shopkeeper |

### Weapons
| Weapon | Used By |
| :----- | :------ |
| Poison | W. Snider, G. Mallory, R. Pottinger |
| Pistol | H. Ellery, S. York, E. Pitts, R. Pottinger |
| SMG | S. York, E. Pitts, R. Pottinger |
| Dagger | H. Ellery, S. York, W. Snider, R. Pottinger |
| Axe | H. Ellery, E. Pitts, R. Pottinger |
| Bare hands | S. York, G. Mallory, E. Pitts, R. Pottinger |
| Rope | S. York, G. Mallory, R. Pottinger |
| Acid | H. Ellery, W. Snider, G. Mallory, R. Pottinger |
