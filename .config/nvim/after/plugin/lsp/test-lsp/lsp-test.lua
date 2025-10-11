-- ===================================
-- Error: Attempting a type mismatch
-- ===================================
---@type number
   local myNumber = "This will cause a type-check error."

-- ===================================
-- Warning: Creating a global variable by mistake
-- ===================================
-- The language server will warn about `myGlobal` because it was not explicitly declared `local`.
myGlobal = "This will cause a lowercase-global warning."

-- ===================================
-- Information: Annotating a deprecated function
-- ===================================
-- The `@deprecated` annotation provides information to developers about an outdated function.
---@deprecated Please use a more modern function.
function outdated_function()
    return "This function is deprecated."
end

-- Call the deprecated function to use it.
outdated_function()

-- ===================================
-- Hint: Using an unused local variable
-- ===================================
-- The language server will hint that `unused_variable` is never used.
local unused_variable = "This variable is not used."

-- ===================================
-- Hint: A non-local loop iterator variable
-- ===================================
-- The variable `i` is not declared as `local` in the loop, which can cause a hint.
for i = 1, 3 do
    -- Some operation
end

-- ===================================
-- Note: A placeholder for an informational note.
-- ===================================
-- Many editors show general notes or suggestions. Here we use an empty table
-- to hint at an incomplete structure, which may be flagged depending on your settings.
local incomplete_table = {}

