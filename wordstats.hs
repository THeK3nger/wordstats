import Control.Monad (forM_)
import Data.Char (isAlphaNum, isSpace, toLower)
import Data.List (group, sort, sortBy)
import System.Environment (getArgs)
import Text.Printf (printf)

type Stats = [(String, Int, Double)]

-- A list of words that are semantically not important and can be filtered out from the document.
commonWordsInItalian :: [String]
commonWordsInItalian = ["a", "un", "il", "con", "e", "gli", "di", "che", "non", "la", "ma", "è", "ho", "una", "in", "da", "per", "mi", "sono", "le", "del"]

wordList :: String -> [String]
wordList = words . map toLower . filter (\c -> isAlphaNum c || isSpace c)

filterCommon :: [String] -> [String]
filterCommon = filter (`notElem` commonWordsInItalian)

wordStats :: [String] -> Stats
wordStats x = map (\ws -> (head ws, length ws, fromIntegral (length ws) / fromIntegral (length x))) $ group $ sort x

printStats :: Stats -> IO ()
printStats stats =
  do
    let statsCut = take 25 stats
    forM_ statsCut (\(w, i, r) -> putStrLn (printf "%-15s \t| %8d | %8.3f‰" w i (r * 100)))

main :: IO ()
main = do
  args <- getArgs
  contents <- readFile (head args)
  let ws = filterCommon $ wordList contents
  let stats = wordStats ws
  let wordsNum = length ws
  printStats $ sortBy (\(_, x, _) (_, y, _) -> compare y x) stats
  putStrLn ""
  printf "Total Words:        %-4d\n" wordsNum
  printf "Total Unique Words: %-4d\n" (length stats)
