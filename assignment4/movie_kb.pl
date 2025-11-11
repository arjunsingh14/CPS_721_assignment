% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Arjun Bhandal
%%%%% NAME: Golsa Momeni
%%%%% NAME: Bardia Shirsalimian


% Put your movie KB in the section below

%%%%% SECTION: database
%%%%% Atomic propositions for the movie knowledge base

releaseInfo(jaws, 1975, 164).
releaseInfo(glass_onion, 2022, 139).
releaseInfo(oppenheimer, 2023, 180).
releaseInfo(midsommar, 2019, 171).
releaseInfo(the_godfather, 1972, 175).
releaseInfo(the_godfather_part_2, 1974, 202).
releaseInfo(epic_crime, 1974, 185).
releaseInfo(take_this_waltz, 2011, 116).
releaseInfo(serpico, 1973, 130).
releaseInfo(black_bag, 2015, 93).
releaseInfo(tar, 2022, 158).
releaseInfo(happy_hour, 1950, 117).
releaseInfo(maybe_one_day, 2024, 140).
releaseInfo(paris_nights, 2023, 141).
releaseInfo(best_days, 1951, 139).
releaseInfo(good_times, 2021, 138).
releaseInfo(fading_echoes, 2025, 95).  % new movie for currentYear(2025)


directedBy(jaws, steven_spielberg).
directedBy(glass_onion, rian_johnson).
directedBy(oppenheimer, christopher_nolan).
directedBy(midsommar, ari_aster).
directedBy(the_godfather, francis_ford_coppola).
directedBy(the_godfather_part_2, francis_ford_coppola).
directedBy(epic_crime, martin_scorsese).
directedBy(take_this_waltz, sarah_polley).
directedBy(serpico, sidney_lumet).
directedBy(black_bag, steven_soderbergh).
directedBy(tar, todd_field).
directedBy(happy_hour, emily_stone).
directedBy(maybe_one_day, emily_stone).
directedBy(paris_nights, kate_stevens).
directedBy(best_days, sasha_brown).
directedBy(good_times, sasha_brown).
directedBy(fading_echoes, alex_moore). 


actedIn(roy_scheider, jaws, martin_brody).
actedIn(richard_dreyfuss, jaws, matt_hooper).
actedIn(janelle_monae, glass_onion, andi_brand).
actedIn(daniel_crag, glass_onion, benoit_blanc).
actedIn(florence_pugh, oppenheimer, jean_tatlock).
actedIn(cillian_murphy, oppenheimer, j_robert_oppenheimer).
actedIn(florence_pugh, midsommar, dani_ardor).
actedIn(jack_reynor, midsommar, christian_hughes).
actedIn(al_pacino, the_godfather, michael_corleone).
actedIn(james_caan, the_godfather, sonny_corleone).
actedIn(diane_keaton, the_godfather, kay_adams).
actedIn(al_pacino, the_godfather_part_2, michael_corleone).
actedIn(robert_de_niro, the_godfather_part_2, vito_corleone).
actedIn(al_pacino, epic_crime, lead_mobster).
actedIn(robert_de_niro, epic_crime, rival_boss).
actedIn(seth_rogen, take_this_waltz, lou_rubin).
actedIn(michelle_williams, take_this_waltz, margot).
actedIn(al_pacino, serpico, frank_serpico).
actedIn(john_randolph, serpico, chief_harrison).
actedIn(cate_blanchett, black_bag, kathryn_jean).
actedIn(matt_damon, black_bag, agent_smith).
actedIn(cate_blanchett, tar, lydia_tar).
actedIn(nina_hoss, tar, sharon_goodnow).
actedIn(kristen_stewart, happy_hour, sasha_james).
actedIn(emma_stone, happy_hour, marie_wells).
actedIn(robert_pattinson, maybe_one_day, adam_jones).
actedIn(florence_pugh, maybe_one_day, lily_baker).
actedIn(florence_pugh, paris_nights, lily_baker).
actedIn(timothee_chalamet, paris_nights, luc_renard).
actedIn(emma_watson, best_days, kate_johnson).
actedIn(gregory_peck, best_days, charles_worth).
actedIn(tom_hanks, good_times, noah_davis).
actedIn(laura_dern, good_times, mary_ellis).
actedIn(zoe_kravitz, fading_echoes, eva_stone).
actedIn(finn_wolfhard, fading_echoes, liam_carter).


movieGenre(jaws, thriller).
movieGenre(jaws, horror).
movieGenre(glass_onion, mystery).
movieGenre(glass_onion, comedy).
movieGenre(oppenheimer, drama).
movieGenre(oppenheimer, biography).
movieGenre(midsommar, horror).
movieGenre(midsommar, psychological).
movieGenre(the_godfather, crime).
movieGenre(the_godfather, drama).
movieGenre(the_godfather_part_2, crime).
movieGenre(epic_crime, crime).
movieGenre(epic_crime, action).
movieGenre(take_this_waltz, romance).
movieGenre(take_this_waltz, drama).
movieGenre(serpico, crime).
movieGenre(serpico, drama).
movieGenre(black_bag, thriller).
movieGenre(black_bag, action).
movieGenre(tar, drama).
movieGenre(tar, music).
movieGenre(happy_hour, comedy).
movieGenre(maybe_one_day, romance).
movieGenre(maybe_one_day, drama).
movieGenre(paris_nights, romance).
movieGenre(paris_nights, drama).
movieGenre(best_days, drama).
movieGenre(best_days, historical).
movieGenre(good_times, comedy).
movieGenre(fading_echoes, sci_fi).
movieGenre(fading_echoes, drama).

%%%%% END

%%%%% SECTION: movie_database

