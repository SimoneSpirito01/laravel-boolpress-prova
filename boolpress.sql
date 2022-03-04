-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Creato il: Mar 04, 2022 alle 21:47
-- Versione del server: 5.7.34
-- Versione PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `boolpress`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `authors`
--

CREATE TABLE `authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `authors`
--

INSERT INTO `authors` (`id`, `username`, `slug`, `created_at`, `updated_at`) VALUES
(6, 'Brittany Roston', 'brittany-roston', '2022-02-28 14:02:45', '2022-03-02 11:31:35'),
(7, 'Rahul Srinivas', 'rahul-srinivas', '2022-02-28 14:11:23', '2022-02-28 14:11:23'),
(8, 'Alvin Reyes', 'alvin-reyes', '2022-02-28 14:18:27', '2022-02-28 14:18:27'),
(9, 'Monica J.White', 'monica-jwhite', '2022-02-28 14:21:27', '2022-02-28 14:21:27'),
(10, 'Rob Rich', 'rob-rich', '2022-02-28 14:27:09', '2022-02-28 14:27:09'),
(11, 'Tushar Mehta', 'tushar-mehta', '2022-02-28 14:31:21', '2022-02-28 14:31:21'),
(12, 'Brian Heater', 'brian-heater', '2022-03-01 12:09:14', '2022-03-01 12:09:14'),
(13, 'Ingrid Lunden', 'ingrid-lunden', '2022-03-01 12:16:30', '2022-03-01 12:16:30'),
(14, 'Rebecca Bellan', 'rebecca-bellan', '2022-03-01 12:30:08', '2022-03-01 12:30:08');

-- --------------------------------------------------------

--
-- Struttura della tabella `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Tech', 'tech', '2022-02-28 14:01:17', '2022-02-28 14:01:17'),
(2, 'Cars', 'cars', '2022-02-28 14:15:13', '2022-02-28 14:15:13'),
(3, 'Gaming', 'gaming', '2022-02-28 14:21:33', '2022-02-28 14:26:06'),
(4, 'Entertainment', 'entertainment', '2022-02-28 14:26:53', '2022-02-28 14:26:53'),
(5, 'Science', 'science', '2022-02-28 14:30:57', '2022-02-28 14:30:57'),
(6, 'Health', 'health', '2022-02-28 14:41:41', '2022-02-28 14:41:41');

-- --------------------------------------------------------

--
-- Struttura della tabella `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Anonymous',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `name`, `content`, `approved`, `created_at`, `updated_at`) VALUES
(5, 1, 'Anonymous', 'c', 1, '2022-03-02 10:29:46', '2022-03-02 10:34:52'),
(6, 1, 'Anonymous', 'afwf', 1, '2022-03-02 10:29:48', '2022-03-02 10:34:58'),
(14, 5, 'Anonymous', 'effg', 0, '2022-03-02 18:26:50', '2022-03-02 18:26:50'),
(15, 5, 'Anonymous', 'ciao', 0, '2022-03-02 18:32:07', '2022-03-02 18:32:07'),
(16, 5, 'Anonymous', 'c', 0, '2022-03-02 18:34:14', '2022-03-02 18:34:14'),
(34, 3, 'Anonymous', 'ciao', 0, '2022-03-03 08:42:58', '2022-03-03 08:42:58'),
(35, 3, 'Anonymous', 'ciao', 0, '2022-03-03 08:43:01', '2022-03-03 08:43:01'),
(36, 3, 'Anonymous', 'ciao', 0, '2022-03-03 08:43:45', '2022-03-03 08:43:45'),
(37, 3, 'Anonymous', 'ciao', 0, '2022-03-03 08:43:51', '2022-03-03 08:43:51'),
(38, 3, 'Anonymous', 's', 0, '2022-03-03 08:44:51', '2022-03-03 08:44:51'),
(39, 3, 'Anonymous', 's', 0, '2022-03-03 08:46:38', '2022-03-03 08:46:38'),
(40, 3, 'Anonymous', 'c', 0, '2022-03-03 08:50:12', '2022-03-03 08:50:12'),
(41, 3, 'Anonymous', 'c', 0, '2022-03-03 08:50:17', '2022-03-03 08:50:17'),
(42, 3, 'Anonymous', 'x', 0, '2022-03-03 08:56:01', '2022-03-03 08:56:01'),
(43, 3, 'Anonymous', 'c', 0, '2022-03-03 08:56:59', '2022-03-03 08:56:59'),
(44, 3, 'Anonymous', 'c', 0, '2022-03-03 09:01:25', '2022-03-03 09:01:25'),
(45, 3, 'Anonymous', 'ciao', 0, '2022-03-03 09:03:03', '2022-03-03 09:03:03'),
(46, 3, 'Anonymous', 'c', 0, '2022-03-03 09:04:09', '2022-03-03 09:04:09'),
(47, 3, 'Anonymous', 'c', 0, '2022-03-03 09:04:10', '2022-03-03 09:04:10'),
(48, 3, 'Anonymous', 'c', 0, '2022-03-03 09:04:22', '2022-03-03 09:04:22'),
(49, 3, 'Anonymous', 'x', 0, '2022-03-03 09:05:48', '2022-03-03 09:05:48'),
(50, 3, 'Anonymous', 'c', 0, '2022-03-03 09:06:07', '2022-03-03 09:06:07'),
(51, 3, 'Anonymous', 'ciao', 0, '2022-03-03 09:08:23', '2022-03-03 09:08:23'),
(52, 3, 'Anonymous', 'x', 0, '2022-03-03 09:12:46', '2022-03-03 09:12:46'),
(53, 3, 'Anonymous', 'ciao come va?', 0, '2022-03-03 09:13:13', '2022-03-03 09:13:13'),
(54, 3, 'Anonymous', 'weila', 0, '2022-03-03 09:14:27', '2022-03-03 09:14:27'),
(55, 3, 'Anonymous', 'Bel post!', 0, '2022-03-03 09:14:41', '2022-03-03 09:14:41'),
(59, 7, 'Simone', 'ciao', 1, '2022-03-03 17:01:56', '2022-03-03 17:03:17'),
(60, 1, 'Anonymous', 'ciao', 0, '2022-03-03 22:26:25', '2022-03-03 22:26:25'),
(61, 10, 'simo', 'ciao', 1, '2022-03-04 09:47:12', '2022-03-04 09:47:27'),
(62, 10, 'Ale', 'Mom dj', 1, '2022-03-04 09:56:07', '2022-03-04 09:56:18');

-- --------------------------------------------------------

--
-- Struttura della tabella `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2022_02_15_104302_create_posts_table', 1),
(5, '2022_02_17_095058_create_categories_table', 1),
(6, '2022_02_17_095500_update_column_category_id_in_posts_table', 1),
(7, '2022_02_18_112521_update_image_col_posts_table', 1),
(8, '2022_02_21_104656_create_tags_table', 1),
(9, '2022_02_21_113355_create_post_tag_table', 1),
(10, '2022_02_28_104156_create_comments_table', 1),
(11, '2022_02_28_133605_create_authors_table', 1),
(12, '2022_02_28_134931_update_add_author_column_in_posts_table', 1),
(13, '2022_03_01_132214_update_title_column_in_posts_table', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(110) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `content`, `published`, `created_at`, `updated_at`, `category_id`, `image`, `author_id`) VALUES
(1, 'Apple leak claims foldable with huge display may be a MacBook and iPad hybrid', 'apple-leak-claims-foldable-with-huge-display-may-be-a-macbook-and-ipad-hybrid', '<p>\r\n    The foldables market is still in its infancy, but Apple may already be planning for a future in which these gadgets are far more common and in demand. According to <a href=\"\">a new leak</a>, the company may be working on a foldable project that sports a huge display — one measuring \"roughly\" 20-inches across. A device at that size would likely indicate a foldable laptop or a type of laptop/tablet hybrid, which <a href=\"\">isn\'t a new concept</a> despite still being a rarity on the market.\r\n</p>\r\n<p>\r\n    The claim was included as part of the latest newsletter from Bloomberg\'s Mark Gurman, who cites Display Supply Chain Consultants\' <a href=\"\">Ross Young as the source</a> of the information. It\'s not yet clear what form this alleged foldable will take, according to the leak, which notes that Apple could either use part of the foldable screen as a large digital keyboard or combine the flexible panel with a physical keyboard — the latter of which would no doubt be more appealing to users who type on a regular basis, but make the device more clunky as a tablet.\r\n</p>\r\n<p>\r\n    Foldable devices have grown in popularity, though they\'re largely limited to the smartphone market. Samsung has released multiple generations of its <a href=\"\">Galaxy Z Flip</a> and <a href=\"\">Galaxy Z Fold</a> handsets, the latter of which is more like a smartphone/tablet hybrid. Motorola, too, has resurrected its popular Razr flip phone with its <a href=\"\">clamshell-style foldable</a> under the same name. Lenovo took things one step farther during CES 2020 with its ThinkPad X1 Fold, a foldable laptop that could double as a tablet.\r\n</p>\r\n<p>\r\n    Despite that, folding laptops aren\'t anywhere close to mainstream at this time and it\'ll likely be years before we see anything similar from Apple — a fact backed up by Young in Gurman\'s report, who cites him as giving a possible release date of around 2026 for the alleged 20-inch foldable device. The leak goes on to claim that Apple has been reportedly working on this device for a \"couple of years,\" though how many resources it has dedicated to the alleged product is unclear. The possibility of a MacBook/iPad \"hybrid\" is specifically mentioned, though far from confirmed.\r\n</p>\r\n<p>\r\n    Apple has multiple large products in the pipeline, including the <a href=\"\">Apple Car</a> we\'ve been hearing about for years, as well as the AR/VR headsets <a href=\"\">expected to hit the market</a> either around the end of 2022 or sometime in 2023. It\'s difficult to anticipate where an Apple foldable tablet or laptop could slot in among the company\'s existing and upcoming products, but that assumes the alleged device will pan out at all. It\'s entirely possible Apple could scrap whatever concept it may currently have — or, alternatively, a foldable device brought to market may look substantially different than what sources are currently seeing.\r\n</p>', 1, '2022-02-28 14:05:19', '2022-03-01 07:55:48', 1, 'uploads/zTkf6IHE40fbMguKCNY9xK0CnUjqrMgnWloZoLRF.webp', 6),
(2, 'Lenovo IdeaPad 2022 lineup flexes Windows 11 while M10 keeps android simple', 'lenovo-ideapad-2022-lineup-flexes-windows-11-while-m10-keeps-android-simple', '<p>\r\n    Lenovo seems to be using the 2022 Mobile World Congress as a launchpad for most of its 2022 products. The company\'s MWC 2022 launches so far include brand new Chromebooks, a new range of gaming notebooks, fresh convertible laptops that target both regular consumers and small businesses, and not to mention — a refreshed ThinkPad lineup.\r\n</p>\r\n<p>\r\n    In this article, we take a closer look at four new products Lenovo unveiled at MWC 2022. Three of these devices belong to Lenovo\'s consumer-centric IdeaPad lineup of Windows 11-powered notebooks. They include the IdeaPad Flex 5i and the IdeaPad Flex 5 — both of which happen to be convertible notebooks. The third IdeaPad product is the Duet 5i which boasts a detachable keyboard unit that can be added or removed whenever needed.\r\n</p>\r\n<p>\r\n    Another device we shall be looking at in this article is the Lenovo Tab M10 Plus, an Android-powered tablet currently in its third generation.\r\n</p>', 1, '2022-02-28 14:12:29', '2022-03-01 07:56:34', 1, 'uploads/fTCR10NFPFEJ1vxVgb2daTWBzR0fwE6mvYMYbh2e.webp', 7),
(3, 'Morgan super 3 is a modern reboot of the iconic 3-Wheeler', 'morgan-super-3-is-a-modern-reboot-of-the-iconic-3-wheeler', '<p>\r\n    We first caught a glimpse of Morgan\'s all-new <a class=\"link\" href=\"\">3-Wheeler</a> last year, and the first thing we noticed (despite the car\'s heavy camouflage) was the absence of a V-twin engine between those iconic round headlamps. But now, the Morgan Motor Company has officially lifted the veil on its newest 3-Wheeler, now called the <a href=\"\">Super 3</a>.\r\n</p>\r\n\r\n<p>\r\n    It may look similar to the old car, but the latest Super 3 is the first Morgan to have a three-part aluminum monocoque frame. It\'s also the first clean-sheet design by Morgan since launching the Aero 8 twenty-two years ago. \"Super 3 stands out as something different,\" said Jonathan Wells, Head of Design, Morgan Motor Company. \"It looks toward our past, is relevant to the present, and reinstates a firm vision of Morgan\'s design future.\"\r\n</p>\r\n<h3>Morgan Super 3: Jet-Age Design</h3>\r\n<div class=\"image\">\r\n    <img src=\"https://www.slashgear.com/img/gallery/morgan-super-3-is-a-modern-reboot-of-the-iconic-3-wheeler/morgan-super-3-jet-age-design-1645802912.webp\" alt=\"\">\r\n</div>\r\n<p>\r\n    Whereas the outgoing 3-Wheeler drew inspiration from the 1920s, the Super 3\'s sleek and aerodynamically optimized body drew influence from the jet age of the mid to late century. However, the aero-optimized design still evokes vintage touches of a long-gone era. It still has round headlights, a horseshoe front grille, and a pull-rod front suspension that now attaches to a cast-aluminum \"Hartland Strut\" architecture.\r\n</p>\r\n<p>\r\n    The Super 3 has glorious front aero wheels wrapped in modern Avon Speedmaster tires with ballooned sidewalls. In addition, the insides of the front wheels are closed off to deliver better aerodynamics at speed, and everything you see in the front (the suspension wishbones, pull-rod suspension, and headlights) were optimized to improve airflow towards the radiator to improve engine cooling.\r\n</p>', 1, '2022-02-28 14:20:23', '2022-03-01 07:57:01', 2, 'uploads/V7YXO1D2J6kZqSLVEi8r3diKVOh7OqJAI3DTg4XO.webp', 8),
(4, 'February 2022 Pokemon presents: everything announced', 'february-2022-pokemon-presents-everything-announced', '<p>\r\n    Pokemon dropped its 14-minute Pokemon Presents today, and it\'s packed full of interesting teasers for many Pokemon titles. As part of Pokemon Day celebrations (and to commemorate the fact that it\'s been a whopping 26 years since the games first launched in Japan), players can expect new updates, free gifts, and an all-new generation of games. Check out what exactly is going to happen over the next couple of weeks to make sure you don\'t miss out on any freebies!\r\n</p>\r\n<p>\r\n    Video game developer Game Freak has announced updates to pretty much every title it possibly could bring updates to. Sure, some players were hoping for a new \"Let\'s Go\" game (that\'s not happening) or for \"<a href=\"\">Detective Pikachu</a>\" on the Switch (also not happening), but there\'s plenty of fun stuff to be excited about.\r\n</p>\r\n<p>\r\n    \"Pokemon Go,\" \"Pokemon Masters EX,\" \"Pokemon Cafe Remix,\" \"Pokemon Unite,\" \"Pokemon Brilliant Diamond,\" \"Pokemon Shining Pearl,\" and \"Pokemon Legends Arceus\" will all receive updates shortly. We\'re also getting a brand-new animated series, this time strictly online. Let\'s go over everything that was announced during the latest Pokemon Presents broadcast.\r\n</p>\r\n<h3>New Pokemon games, Pokemon Go and Pokemon Masters EX updates</h3>\r\n<p>\r\n    Perhaps the biggest piece of information revealed today was that the next generation of Pokemon will hit the market later this year. Dubbed \"Pokemon Scarlet\" and \"Pokemon Violet,\" the games will feature an open-world region, new starters, and many more Pokemon all out in the open. We\'ve already <a href=\"\">detailed the new games</a>, so make sure to check that out if you\'re excited for the ninth generation of Pocket Monsters.\r\n</p>\r\n<p>\r\n    The Pokemon Presents trailer starts out with \"Pokemon Go,\" and it\'s pretty huge: Alola, the region found in \"Pokemon Sun\" and \"Pokemon Moon,\" is coming to \"Go\" starting March 1, 2022. Until that happens, Alolan Exeggutor will start appearing in \"Pokemon Go,\" letting players catch one for themselves.\r\n</p>\r\n<p>\r\n    \"Pokemon Masters EX\" is also receiving major updates as part of its two-and-a-half-year <a href=\"\">anniversary</a>. Victory Road is being added, featuring powerful sync pairs from many regions and legendary trainers such as Blue, Lance, Cynthia, N, Steven, and Wallace. If you manage to complete Victory Road, you\'ll be given the chance to team up with Sygna Suit Red, Blue, or Leaf. You will also be awarded 5,000 gems.\r\n\r\n</p>\r\n<p>\r\n    Some new trainers in special outfits are coming to \"Pokemon Masters EX\" to celebrate Pokemon Day, including May with Latias starting February 28, Skyla with Tornadus starting March 2, and Raihan with Flygon starting March 4. Until March 17, players will be able to scout up to 100 sync pairs at no extra cost and will be given a 10-pair ticket every day. Lastly, 3,000 gems will be awarded to everyone as a login bonus.\r\n</p>', 1, '2022-02-28 14:25:40', '2022-03-01 07:57:26', 3, 'uploads/Q2Mioxeesu6ai9Zkp5yAJSKRyTpozd98ljL2q304.webp', 9),
(5, 'Netflix\'s lost Marvel shows are heading to Disney+ in Canada', 'netflixs-lost-marvel-shows-are-heading-to-disney-in-canada', '<p>\r\n      With the loss of Netflix\'s lineup of Marvel shows still set for the start\r\n      of March 2022, it would be nice to know where else they might pop up\r\n      again. According to MobileSyrup, and later confirmed by Engadget, it looks\r\n      like Dinsey+ might just become their new home — in Canada, at least.\r\n    </p>\r\n    <p>\r\n      MobileSyrup reports that \"Daredevil,\" \"Jessica Jones,\" \"Luke Cage,\" \"Iron\r\n      Fist,\" \"The Defenders,\" and \"The Punisher\" are all bound for the Canadian\r\n      digital house of mouse, though there\'s no mention of \"Agents of\r\n      S.H.I.E.L.D,\" which could indicate that it\'s currently not being carried\r\n      over or that it was simply omitted as it had been in previous reports\r\n      about the series\' removal.\r\n    </p>\r\n    <p>\r\n      The shows are still currently available for viewing on Netflix and will\r\n      remain that way until March 1, 2022, after which point they\'ll be floating\r\n      around in streaming show purgatory for a couple of weeks before popping up\r\n      once more on Canada\'s Disney+ service on March 16.\r\n    </p>\r\n    <h3>Dare to Hope?</h3>\r\n    <div class=\"image\">\r\n      <img\r\n        src=\"https://www.slashgear.com/img/gallery/netflixs-lost-marvel-shows-are-heading-to-disney-in-canada/dare-to-hope-1645735385.webp\"\r\n        alt=\"\"\r\n      />\r\n    </div>\r\n    <p>\r\n      Whether these shows will also be made available on Disney+ in other\r\n      countries has yet to be confirmed, though if they\'re already set to appear\r\n      in one territory, it\'s not unreasonable to think others will follow suit\r\n      in the future. And while Netflix is known for limiting some content to\r\n      specific regions, it\'s not something that happens often with Disney\'s\r\n      service.\r\n    </p>\r\n    <p>\r\n      There\'s also the matter of Disney+ ramping up for more Marvel content,\r\n      including its upcoming \"Moon Knight\" and \"She-Hulk\" shows. It\'s definitely\r\n      leaning hard into the Marvel license, even going so far as to include\r\n      recurring Netflix characters, portrayed by the same actors, in its own\r\n      recent Marvel stories.\r\n    </p>\r\n    <p>\r\n      As Engadget points out, the relatively violent and mature themes found in\r\n      the former Netflix shows might not be the best fit for a family-friendly\r\n      service like Disney+, but if they\'re okay for Canada, they might also be\r\n      okay for elsewhere. Of course, there\'s also Hulu, which Disney also owns\r\n      and uses as the platform for more mature adult-oriented content.\r\n    </p>\r\n    <p>\r\n      So it\'s not a given that these shows will all end up on Disney+ in every\r\n      market, but it\'s also far from impossible.\r\n    </p>', 1, '2022-02-28 14:30:07', '2022-03-01 07:57:50', 4, 'uploads/b1CoR9QJfOFoeA6YCoEv1UkpiUJHegk3oUkftEBl.webp', 10),
(6, 'Why NASA rejected the idea of making NFTs', 'why-nasa-rejected-the-idea-of-making-nfts', '<p>\r\n      NASA is already at the forefront of technology and recently published a\r\n      thorough report documenting the \"<a href=\"\">spin-off 2022</a>\" inventions by its\r\n      engineers and scientists. The organization, although keen to delve into\r\n      technology trends, does not seem very impressed with the idea of\r\n      <a href=\"\">non-fungible tokens (or NFTs)</a>, a recent rage keeping the tech community\r\n      electrified. \r\n    </p>\r\n    <p>\r\n      NASA clarified its images are not protected by any copyright and that\r\n      means anyone can use them for educational or informative use in creating\r\n      content for platforms like YouTube and TikTok. <a href=\"\">NASA</a> has updated its media\r\n      guidelines to clarify that because of the open nature of its media, it\r\n      does not want them to be tokenized as NFTs.\r\n    </p>\r\n    <p>\r\n      To better understand why necessitates grasping what an NFT is. NFTs are\r\n      digital contracts on <a href=\"\">blockchain</a> used to establish unique ownership of an\r\n      asset, generally in the digital form (via The <a href=\"\">Verge</a>). Despite its broad\r\n      nature, NFTs have mostly been associated with the ownership of — sometimes\r\n      weird and outlandish — images and digital illustrations. NFTs are mostly\r\n      stored on an Ethereum-based blockchain and the high energy requirements to\r\n      store and purchase NFTs (using cryptocurrency) has sparked concerns.\r\n    </p>\r\n    <p>\r\n      In the update, NASA stressed, \"Non-Fungible Tokens (NFTs) are, in essence,\r\n      digital tokens owned by someone as a \'one of a kind\' digital asset. NASA\r\n      does not wish for its images to be used for these purposes. It is unlawful\r\n      to falsely claim copyright or other rights in NASA material.\"\r\n    </p>\r\n    <h3>NASA rejects the use of its logos for NFTs</h3>\r\n    <div class=\"image\">\r\n        <img src=\"https://www.slashgear.com/img/gallery/why-nasa-rejected-the-idea-of-making-nfts/nasa-rejects-the-use-of-its-logos-for-nfts-1645468312.webp\" alt=\"\">\r\n    </div>\r\n    <p>\r\n        In contrast to the imagery published by NASA, its logos and other insignia, including the popular \"meatball\" and \"worm\" logos, are copyrighted by the agenct. Even though these media require special permission before they can be used commercially for items like merchandise, NASA has outlined it does not wish these logos or any other merch based them to be used in NFTs.\r\n    </p>\r\n    <p>\r\n        NASA\'s updated <a href=\"\">guidelines for merchandising</a> read, \"NASA is not approving any merchandising applications involving Non-Fungible Tokens (NFTs), as they are not consistent with the categories of products the Agency is approved to merchandise. Further, as stated in the NASA Media Usage Guidelines, NASA does not wish for its images to be used in connection with NFTs.\"\r\n    </p>\r\n    <p>\r\n        Being a government agency, NASA explicitly disapproves the use of its logos being used on certain categories of products. These categories, as highlighted in the merchandising guidelines by the agency, include \"alcohol, food, cosmetics, tobacco, underwear, technology, etc.\"\r\n    </p>\r\n    <h3>Other space-inspired NFTs</h3>\r\n    <div class=\"image\">\r\n        <img src=\"https://www.slashgear.com/img/gallery/why-nasa-rejected-the-idea-of-making-nfts/other-space-inspired-nfts-1645468446.webp\" alt=\"\">\r\n    </div>\r\n    <p>\r\n        NASA\'s rejection of the images of the space being locked out as \"exclusive content\" in NFTs could disappoint space enthusiasts who have been wanting to privately own a glimpse of a far flung galaxy. But at the same time, NASA\'s decision seems only fair and ethical because the space is not owned by anyone — at least not until a multi-billionaire claims their exclusive right on it. That said, it is possible to get in on the NFT space race.\r\n    </p>\r\n    <p>\r\n        Those who still want a share of the pie with flavors of space can explore other unofficial projects like \"flown into space\" by <a href=\"\">Inspiration4</a> or <a href=\"\">Mars4</a>, an NFT-based metaverse that has created a three-dimensional model of Mars using data from agencies like NASA. Anicorn Watches had also released aa NASA-branded NFT last year in which a \"secret timepiece\" designed by NASA logo creator Richard Danne (via <a href=\"\">DeZeen</a>) can be seen floating in dark space. \r\n    </p>', 1, '2022-02-28 14:39:48', '2022-03-01 07:58:13', 5, 'uploads/80LCGlgXom9yNJvU0Rx7zzUpYRy2pTBPRWiIaMy5.webp', 11),
(7, 'Why the CDC says everyone should avoid cruise ships right now', 'why-the-cdc-says-everyone-should-avoid-cruise-ships-right-now', '<p>\r\n      With Omicron cases spreading rapidly throughout the world, the US Centers\r\n      for Disease Control and Prevention (CDC) has published a new bulletin\r\n      advising that travelers avoid cruise ships entirely — even when fully\r\n      vaccinated. The decision comes in part based on the spike in COVID-19\r\n      cases observed among cruise ship passengers and crew members.\r\n    </p>\r\n\r\n    <p>\r\n      Current data shows the number of daily COVID-19 cases in the US started\r\n      spiking astronomically around the beginning of December 2020, a new wave\r\n      largely fueled by the latest variant of concern, Omicron (via\r\n      <a href=\"\">CDC</a>). This new wave — combined with many unanswered\r\n      questions about the variant — has led to renewed restrictions intended to\r\n      curb transmission and help prevent the healthcare system from becoming\r\n      (even more) overloaded.\r\n    </p>\r\n    <p>\r\n      In light of Omicron\'s high transmissibility and the record number of cases\r\n      it has produced, the CDC advises that travelers entirely avoid taking\r\n      trips on cruise ships even if they\'ve received the primary dose of\r\n      COVID-19 vaccines and the booster shot (via <a href=\"\">Reuters</a>). The\r\n      CDC maintains a website that shows the status of various cruise ships\r\n      operating in the US using a color-coded chart.\r\n    </p>\r\n    <p>\r\n      The yellow status indicates that a substantial enough number of COVID-19\r\n      infections have been identified among passengers and/or crew to warrant an\r\n      investigation from the CDC — and, as of\r\n      <a href=\"\">the most recent update</a>, almost all of the cruise lines are\r\n      now listed as yellow. In most cases, the CDC says it has either started an\r\n      investigation or already performed one with plans to continue monitoring\r\n      the vessel.\r\n    </p>\r\n    <div class=\"image\">\r\n      <img\r\n        src=\"https://www.slashgear.com/img/gallery/why-the-cdc-says-everyone-should-avoid-cruise-ships-right-now/disney_fantasy-1280x723.jpg\"\r\n        alt=\"\"\r\n      />\r\n    </div>\r\n    <p>\r\n      Cruise ships currently listed by the CDC as \"yellow\" include the Breeze,\r\n      Conquest, Dream, Elation, Freedom, and a number of other vessels from\r\n      Carnival Cruise Lines, as well as multiple Holland America vessels, and\r\n      Disney\'s Dream, Fantasy, Magic, and Wonder ships — as well as many others\r\n      from different cruise companies.\r\n    </p>\r\n    <h3>Cruise industry reacts</h3>\r\n    <div class=\"image\">\r\n      <img\r\n        src=\"https://www.slashgear.com/img/gallery/why-the-cdc-says-everyone-should-avoid-cruise-ships-right-now/cruise-industry-reacts-import.webp\"\r\n        alt=\"\"\r\n      />\r\n    </div>\r\n\r\n    <p>\r\n      It\'s easy to see why cruise ships can be problematic when attempting to\r\n      avoid a disease largely spread by being in close proximity to an infected\r\n      person. These vessels often have cramped quarters and people tend to\r\n      congregate in shared spaces, including bars, pools, and decks. The limited\r\n      space on a cruise ship means it can be difficult to leave your room but\r\n      still maintain a distance from other people.\r\n    </p>\r\n    <p>\r\n      Despite these concerns and the increasing number of COVID-19 cases on\r\n      cruise ships, the industry hasn\'t responded favorably to the CDC\'s latest\r\n      guidance. Cruise Lines International Association (CLIA) has already\r\n      published a statement on the matter, calling the guidance \"particularly\r\n      perplexing\" in light of the fact that \"the cases identified on cruise\r\n      ships consistently make up a very slim minority of the total population\r\n      onboard.\"\r\n    </p>\r\n    <p>\r\n      CLIA goes on to claim the number of cases on ships are \"far fewer than on\r\n      land,\" also stating that most cases are mild or asymptomatic and\r\n      suggesting that cruise ships could potentially be safer — from an\r\n      infection risk standpoint — than spending one\'s vacation on land.\r\n    </p>\r\n    <p>\r\n      \"Cruise ships offer a highly controlled environment with science-backed\r\n      measures, known testing and vaccination levels far above other venues or\r\n      modes of transportation and travel, and significantly lower incidence\r\n      rates than land.\" Despite these criticisms, CLIA notes that both it and\r\n      its partners in the industry will collaborate with the CDC on these health\r\n      matters.\r\n    </p>', 1, '2022-02-28 14:48:43', '2022-03-01 07:58:53', 6, 'uploads/0KiNZBCG7FkO1FrnFCKkn160V33x85yCll1nI9u9.webp', 6),
(8, 'Alphabet’s Wing drones hit 200,000 deliveries as it announces supermarket partnership', 'alphabets-wing-drones-hit-200000-deliveries-as-it-announces-supermarket-partnership', '<p>\r\n      Alphabet’s drone service Wing this morning announced another milestone, as\r\n      it hit 200,000 commercial deliveries. The number, which the firm says\r\n      excludes test flights, comes half-a-year\r\n      <a href=\"\">after it hit 100,000</a>. Australia, which has been the primary\r\n      market for testing and commercial deployment, comprises 30,000 of those\r\n      deliveries in the first two months of this year.\r\n    </p>\r\n    <p>\r\n      Broken down further, Wing says it was up to more than 1,000 deliveries in\r\n      a day, or one delivery every 25 seconds or so. The big round number\r\n      arrives as it announces a commercial partnership with Coles, one of\r\n      Australia’s leading supermarket chains. The deal finds Wing delivering 250\r\n      different items, from food stuffs to healthcare products and toiletries,\r\n      in Australia’s capital, Canberra.\r\n    </p>\r\n    <p>\r\n      Other recent additions to the delivery service include KFC and Vietnamese\r\n      food from Roll’d, as well as rapid COVID-19 tests from Friendly Grocer and\r\n      first aid kids from St. John Ambulance QLD. Big, round number aside, the\r\n      efficacy of drone delivery in urban areas is still a question mark, as\r\n      many services are more actively eyeing terrestrial robotics as the future\r\n      of last-mile delivery.\r\n    </p>\r\n    <p>\r\n      The technology makes some sense for rural and other harder to reach\r\n      locales, but Wing insists that its approach is right for city life, as\r\n      well.\r\n    </p>\r\n    <p>\r\n      “Integrating drone delivery into daily life isn’t just an added\r\n      convenience,” Google says in a blog post today. “It holds the promise to\r\n      reduce traffic congestion, accidents, and greenhouse gas emissions while\r\n      growing sales for businesses all the while giving people more time back in\r\n      their busy lives. If you want a peek into that future, just look to\r\n      Australia.”\r\n    </p>\r\n    <p>\r\n      Amazon’s competing service, Prime Air, meanwhile, has suffered layoffs\r\n      during the pandemic, leaving questions around the viability of that\r\n      delivery method.\r\n    </p>', 1, '2022-03-01 12:15:34', '2022-03-01 12:15:34', 1, 'uploads/H2flOVqS4OLCu5ocGWXJ4eKqEeEAWOtfLf7dznhh.webp', 12),
(9, 'Nayya nabs $55M to expand its recommendation and personalization engine for healthcare and other benefits', 'nayya-nabs-55m-to-expand-its-recommendation-and-personalization-engine-for-healthcare-and-other-benefits', '<p>\r\n      Digital health came into its own during the Covid-19 pandemic, providing a\r\n      socially-distanced way for people to use apps, smartphone cameras,\r\n      wearables and web services to connect with physicians and handle many\r\n      other tasks that previously would have required attending meetings in\r\n      person. That’s opened the door to a number of other online tools to enter\r\n      the conversation with the promise of giving users not just a straight\r\n      replacement but potentially better service than they might have\r\n      experienced without it. In the latest development, a startup called\r\n      <a href=\"\">Nayya Health</a> — which has built a recommendation engine to\r\n      help people choose benefits, as well as an RPA-style digital assistant to\r\n      help users navigate the sometimes complex waters of insurance, clinical\r\n      and workplace administration when claims do need to be made — has closed a\r\n      round of $55 million.\r\n    </p>\r\n\r\n    <p>\r\n      The Series C equity round is being led by ICONIQ Growth (the VC that makes\r\n      later-stage investments on behalf of a number of family offices for\r\n      high-profile tech leaders such as the Chan Zuckerberg’s), with\r\n      Transformation Capital, Felicis Ventures and SemperVirens also\r\n      participating. Iconic, Felicis and SemperVirens are all existing backers,\r\n      while Transformation is a new investor with this round. The startup has\r\n      been on a fundraising tear in the last year, a mark of how its service has\r\n      grown during Covid-19. Since we covered a <a href=\"\">seed round</a> for\r\n      Nayya in July 2020 — five months into what became a pandemic and global\r\n      shutdown — the startup went on in 2021 to raise two more rounds totaling\r\n      $48 million.\r\n    </p>\r\n    <p>\r\n      Sina Chehrazi, Nayya’s co-founder and CEO, gave me a relatively wide range\r\n      for the current valuation in an interview, between $500 million and $750\r\n      million. The company has however confirmed that it has doubled its\r\n      valuation since the last round, when PitchBook <a href=\"\">estimated</a> to\r\n      be about $235 million, putting the actual number now likely closer to\r\n      $500-600 million.\r\n    </p>\r\n    <p>\r\n      Those numbers, given they are just paper valuations, are more useful just\r\n      as a marker of Nayya’s growth than telling the full story of the startup.\r\n      Chehrazi tells me that he and co-founder Akash Magoon (who is the CTO)\r\n      created Nayya to fill what they saw as an information vacuum in the\r\n      healthcare industry, in particular in the privatized U.S. system.\r\n    </p>\r\n    <p>\r\n      Last year, he said, some 600,000 people filed for bankruptcy protection\r\n      due to healthcare issues — meaning, they were being crippled by the costs\r\n      and managing them. “And many of these, 63%, had insurance,” he noted. Part\r\n      of the problem is the lack of information about getting the best out of a\r\n      policy, combined with the fact that healthcare costs are spiraling.\r\n    </p>\r\n    <p>\r\n      “We’ve been living in a world where if you go to a hospital on the right\r\n      or left side of a street, you might be paying a different amount of money\r\n      of the same procedure,” he said. “People cannot understand their\r\n      healthcare on the best days and struggle to use on their worst days.”\r\n    </p>\r\n    <p>\r\n      While he acknowledges that a lot of this is also institutional and should\r\n      be laid at the feet of lawmakers, while that’s being worked through,\r\n      Nayya’s approach, he said, is “solving the pain today, by helping people\r\n      choose the right plans and use them.”\r\n    </p>\r\n    <p>\r\n      Lawmakers still have a lot to do to make healthcare affordable and usable\r\n      by more people in the U.S., but they have already taken steps to make it a\r\n      legal requirement for clinicians to be more transparent about costs and\r\n      patient data, and that has provided an entry point for companies like\r\n      Nayya (and other health tech companies) to leverage that for its\r\n      algorithms.\r\n    </p>\r\n    <p>\r\n      Nayya’s algorithmic recommendations-meets-RPA engine is used by individual\r\n      consumers, but its customers are employers, who contract with the company\r\n      to provide its engine (and app) to its employees both to help them figure\r\n      out what benefits they should take, based on their health histories and\r\n      other factors such as existing doctors and which networks they are in; and\r\n      then when claims are being made, it helps those individuals also figure\r\n      out how to handle those to get the most out of those exchanges.\r\n    </p>\r\n    <p>\r\n      More recently, Chehrazi said that Nayya has also been contracting with\r\n      insurance companies, which are getting leaned on by bigger employees to\r\n      provide more transparency to employees as part of their service package.\r\n    </p>\r\n    <p>\r\n      Most importantly, he said that Nayya has no intention of becoming an\r\n      insurance provider itself, describing the company’s role as more akin to\r\n      being like a “Turbo Tax” for managing benefits, there to assist and making\r\n      money out of that service alone. (It contacts as B2B and charges a flat\r\n      monthly fee per user, regardless of how often the service is used, so no\r\n      incentive is worked into the model to encourage more or less usage.)\r\n    </p>\r\n    <p>\r\n      On the basic level of per-user growth, the company has seen revenues grow\r\n      7x since last year and will grow another 3x this year, Chehrazi said. It\r\n      doesn’t disclose customer numbers but said that it works both with large\r\n      enterprises and companies with as few as 50 employees. It will also over\r\n      time launch a product targeting freelancers and sole traders that might\r\n      want to use its recommendations system — although it’s not clear if that\r\n      will be sold through the companies where those people contract for work,\r\n      or directly to those individuals.\r\n    </p>\r\n    <p>\r\n      Over time, Nayya has expanded into more than healthcare into providing\r\n      recommendations and administrative assistance for other benefits that\r\n      organizations provide to employees, including life insurance, financial\r\n      planning (eg, around pensions or for those using their salaries to\r\n      regularly pay off student loans), and ancillary services like mental\r\n      health and wellness.\r\n    </p>\r\n    <p>\r\n      “We believe Nayya’s exceptional growth and adoption in just over two years\r\n      is a true testament to the strength of the sophisticated data-driven\r\n      platform and growing market need. It’s becoming increasingly critical for\r\n      employees to be equipped with effective and data driven tools to make more\r\n      informed benefit decisions both at enrollment and throughout the year,”\r\n      said Caroline Xie, general partner at ICONIQ Growth, in a statement. “We\r\n      are thrilled to continue supporting the Nayya team as they extend their\r\n      mission.”\r\n    </p>\r\n    <p>\r\n      “Investing in the future of benefits is extremely important, especially as\r\n      the healthcare landscape and expectations of consumers are changing so\r\n      rapidly,” added Mike Dixon, managing partner at Transformation Capital.\r\n      “Nayya has successfully integrated Artificial Intelligence into the entire\r\n      benefits experience – creating a consumer-driven platform that erases\r\n      benefits-related confusion and stress – while solving a massive challenge\r\n      almost all businesses and their employees face.”\r\n    </p>', 1, '2022-03-01 12:27:22', '2022-03-01 12:28:55', 6, 'uploads/vQOo8qKkCnw4U9IFYj9Q6jajDtPkIaqUDKwGUVo9.webp', 13),
(10, 'Waymo to begin charging for robotaxi rides in San Francisco', 'waymo-to-begin-charging-for-robotaxi-rides-in-san-francisco', '<p>\r\n      Waymo, the self-driving unit of Alphabet, has scored a permit with the\r\n      California Public Utilities Commission that allows it to charge riders for\r\n      ride-hailing trips in its autonomous vehicles in San Francisco. A human\r\n      safety operator must be present, though, per the permit’s stipulations.\r\n    </p>\r\n    <p>\r\n      Securing this permit from the California Public Utilities Commission\r\n      (CPUC) is one of the company’s final steps on the road to commercializing\r\n      AVs in San Francisco. Last September, the California Department of Motor\r\n      Vehicles granted\r\n      <a href=\"\">Waymo a drivered deployment permit in the city</a>, which\r\n      allowed the company to receive compensation for services provided by an\r\n      AV.\r\n    </p>\r\n    <p>\r\n      The permit did not allow Waymo to charge specifically for robotaxi\r\n      services, but the company was able to earn revenue from autonomous\r\n      delivery. In November, Waymo partnered with supermarket chain Albertsons\r\n      to deliver groceries to select customers in San Francisco.\r\n    </p>\r\n    <p>\r\n      Since August last year, Waymo has been\r\n      <a href=\"\">offering unpaid rides in San Francisco</a> to members of its\r\n      Trusted Tester program, a vetted group of individuals that help the\r\n      company learn about its service by offering detailed feedback on their\r\n      riding experience. They also sign a nondisclosure agreement to be a part\r\n      of the program, the waitlist of which is tens of thousands strong, says\r\n      Waymo.\r\n    </p>\r\n    <p>\r\n      In the next couple of weeks, Waymo will advance the program to offer paid\r\n      rides anywhere within Waymo’s SF service area 24/7.\r\n    </p>\r\n    <p>\r\n      “We take a step-by-step approach on the path to rolling out our fully\r\n      autonomous experience to the public,” Nick Smith, a Waymo spokesperson\r\n      told TechCrunch. “That’s the approach we took in Arizona – deeply rooted\r\n      in our focus on safety – and it’s the approach we’ll take in any of the\r\n      cities we operate in going forward. We start with an autonomous specialist\r\n      behind the wheel operating in autonomous mode, and open the rides to a\r\n      select group of Trusted Testers for free, before we begin charging.\r\n      Eventually we move to launching in rider only mode (without anyone else in\r\n      the car). This path helps us to gain learnings about operating our service\r\n      and worked well for us in Arizona, where we’ve completed tens of thousands\r\n      of trips in rider only mode for thousands of riders.”\r\n    </p>\r\n    <p>\r\n      The company would not share how many of its autonomous Jaguar I-PACEs it\r\n      has in its fleet, but the latest CPUC quarterly\r\n      <a href=\"\">report</a> found Waymo had around 100 vehicles available for\r\n      trips by a rider at some point during the reporting period.\r\n    </p>\r\n    <p>\r\n      Waymo One, the company’s ride-hailing service, is already available in\r\n      Phoenix, Arizona as a driverless service, and should give an indication of\r\n      how much the service might cost. A recent CNBC report found a five-mile\r\n      ride that took 14 minutes ended up costing around $1 per minute. The\r\n      average Uber ride is about $0.40 per minute.\r\n    </p>\r\n    <p>\r\n      “Pricing will be reasonable and competitive with other services in San\r\n      Francisco, but we don’t have any specifics to share at this time,” said\r\n      Smith.\r\n    </p>\r\n    <p>\r\n      Once Waymo makes the full transition to paid rides, it will stop offering\r\n      free rides to Trusted Testers in San Francisco, said Smith.\r\n    </p>\r\n    <p>\r\n      Waymo’s biggest competitor in the city, Cruise, was granted a driverless\r\n      deployment permit by the California DMV on the same day that Waymo was\r\n      granted a drivered permit, and has been offering free rides without a\r\n      human safety operator to members of the public since early February.\r\n      Cruise is still awaiting a CPUC permit to charge for those rides. Waymo\r\n      declined to comment on whether or not it had applied with the DMV for a\r\n      driverless permit.\r\n    </p>', 1, '2022-03-01 12:33:23', '2022-03-01 12:33:23', 2, 'uploads/0DtVrgFpfUMX2lqAbfk96vJEqJJ40IjgolPKKgpG.webp', 14);

-- --------------------------------------------------------

--
-- Struttura della tabella `post_tag`
--

CREATE TABLE `post_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `post_tag`
--

INSERT INTO `post_tag` (`id`, `tag_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 3, 1, NULL, NULL),
(4, 4, 2, NULL, NULL),
(5, 5, 2, NULL, NULL),
(6, 6, 2, NULL, NULL),
(7, 7, 2, NULL, NULL),
(8, 8, 3, NULL, NULL),
(9, 9, 3, NULL, NULL),
(10, 10, 3, NULL, NULL),
(11, 11, 4, NULL, NULL),
(12, 12, 4, NULL, NULL),
(13, 13, 5, NULL, NULL),
(14, 14, 5, NULL, NULL),
(15, 15, 5, NULL, NULL),
(16, 16, 5, NULL, NULL),
(17, 17, 6, NULL, NULL),
(18, 18, 6, NULL, NULL),
(19, 19, 6, NULL, NULL),
(20, 20, 7, NULL, NULL),
(21, 21, 7, NULL, NULL),
(22, 22, 8, NULL, NULL),
(23, 23, 8, NULL, NULL),
(24, 24, 8, NULL, NULL),
(25, 21, 9, NULL, NULL),
(26, 25, 9, NULL, NULL),
(27, 22, 10, NULL, NULL),
(28, 26, 10, NULL, NULL),
(29, 27, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'apple', 'apple', '2022-02-28 14:01:28', '2022-02-28 14:01:28'),
(2, 'foldable', 'foldable', '2022-02-28 14:01:42', '2022-02-28 14:01:42'),
(3, 'leak', 'leak', '2022-02-28 14:01:50', '2022-02-28 14:01:50'),
(4, 'lenovo', 'lenovo', '2022-02-28 14:10:19', '2022-02-28 14:10:19'),
(5, 'windows11', 'windows11', '2022-02-28 14:10:26', '2022-02-28 14:10:26'),
(6, 'android', 'android', '2022-02-28 14:10:30', '2022-02-28 14:10:30'),
(7, 'MWC22', 'mwc22', '2022-02-28 14:11:01', '2022-02-28 14:11:01'),
(8, 'ford', 'ford', '2022-02-28 14:18:56', '2022-02-28 14:18:56'),
(9, '3-wheeler', '3-wheeler', '2022-02-28 14:19:47', '2022-02-28 14:19:47'),
(10, 'iconic', 'iconic', '2022-02-28 14:19:53', '2022-02-28 14:19:53'),
(11, 'pokemon', 'pokemon', '2022-02-28 14:21:42', '2022-02-28 14:21:42'),
(12, 'pokemon games', 'pokemon-games', '2022-02-28 14:22:17', '2022-02-28 14:22:17'),
(13, 'netflix', 'netflix', '2022-02-28 14:27:01', '2022-02-28 14:27:01'),
(14, 'disney+', 'disney', '2022-02-28 14:27:22', '2022-02-28 14:27:22'),
(15, 'marvel', 'marvel', '2022-02-28 14:27:27', '2022-02-28 14:27:27'),
(16, 'canada', 'canada', '2022-02-28 14:27:38', '2022-02-28 14:27:38'),
(17, 'nasa', 'nasa', '2022-02-28 14:38:56', '2022-02-28 14:38:56'),
(18, 'nft', 'nft', '2022-02-28 14:39:00', '2022-02-28 14:39:00'),
(19, 'blockchain', 'blockchain', '2022-02-28 14:39:10', '2022-02-28 14:39:10'),
(20, 'cruise', 'cruise', '2022-02-28 14:43:56', '2022-02-28 14:43:56'),
(21, 'covid19', 'covid19', '2022-02-28 14:44:03', '2022-02-28 14:44:03'),
(22, 'alphabet', 'alphabet', '2022-03-01 12:06:20', '2022-03-01 12:06:20'),
(23, 'drones', 'drones', '2022-03-01 12:06:26', '2022-03-01 12:06:26'),
(24, 'supermarket', 'supermarket', '2022-03-01 12:06:36', '2022-03-01 12:06:36'),
(25, 'healthcare', 'healthcare', '2022-03-01 12:16:59', '2022-03-01 12:17:09'),
(26, 'sanfrancisco', 'sanfrancisco', '2022-03-01 12:29:43', '2022-03-01 12:29:43'),
(27, 'taxi', 'taxi', '2022-03-01 12:29:46', '2022-03-01 12:29:46');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Simone', 'simo.phoo@gmail.com', NULL, '$2y$10$VDUtGwsMdbHckXOKy18eWODlGXWeshASkOvUwU4PcuQ8oRqwp85ne', 'priJZg3ElpFu8546Kr3uXvcQAxmEbpmFpFftQxRnulEvWPIh06kkOGdKhcyA', '2022-02-28 13:20:17', '2022-02-28 13:20:17');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `authors_username_unique` (`username`),
  ADD UNIQUE KEY `authors_slug_unique` (`slug`);

--
-- Indici per le tabelle `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indici per le tabelle `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_post_id_foreign` (`post_id`);

--
-- Indici per le tabelle `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indici per le tabelle `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_category_id_foreign` (`category_id`),
  ADD KEY `posts_author_id_foreign` (`author_id`);

--
-- Indici per le tabelle `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_tag_tag_id_foreign` (`tag_id`),
  ADD KEY `post_tag_post_id_foreign` (`post_id`);

--
-- Indici per le tabelle `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `authors`
--
ALTER TABLE `authors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT per la tabella `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT per la tabella `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT per la tabella `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT per la tabella `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`),
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
