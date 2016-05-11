CREATE PROC RunQuery @query INT
AS
	IF @query = 1
		SELECT B.Title, Bran.BranchName, Cop.No_Of_Copies
		FROM Book_Copies as Cop
		INNER JOIN Library_Branch AS Bran
		ON Cop.BranchId = Bran.BranchId
		INNER JOIN Book AS B
		ON Cop.BookId = B.BookId
		WHERE B.Title = 'The Lost Tribe'
		AND Bran.BranchName = 'Sharpstown'
		
	IF @query = 2
		SELECT B.Title, Bran.BranchName, Cop.No_Of_Copies
		FROM Book_Copies as Cop
		INNER JOIN Library_Branch AS Bran
		ON Cop.BranchId = Bran.BranchId
		INNER JOIN Book AS B
		ON Cop.BookId = B.BookId
		WHERE B.Title = 'The Lost Tribe'
		
	IF @query = 3
		SELECT *
		FROM Borrower AS Bor
		LEFT OUTER JOIN Book_Loans AS Loan
		ON Bor.CardNo = Loan.CardNo
		WHERE Loan.BookId IS NULL
		
	IF @query = 4
		SELECT Bor.Name, Book.Title, Bor.[Address]
		FROM Book_Loans AS Loan
		INNER JOIN Library_Branch AS Bran
		ON Loan.BranchId = Bran.BranchId
		INNER JOIN Book
		ON Loan.BookId = Book.BookId
		INNER JOIN Borrower AS Bor
		ON Loan.CardNo = Bor.CardNo
		WHERE Bran.BranchName = 'Sharpstown'
		AND Loan.DueDate = CAST(GETDATE()AS DATE)
		
	IF @query = 5
		SELECT Bran.BranchName, COUNT(*) AS TotalCheckedOut
		FROM Book_Loans AS Loan
		INNER JOIN Library_Branch AS Bran
		ON Loan.BranchId = Bran.BranchId
		GROUP BY Bran.BranchName
		
	IF @query = 6
		SELECT Bor.Name, Bor.[Address], Bor.Phone, COUNT(*)
		FROM Borrower AS Bor
		LEFT OUTER JOIN Book_Loans AS Loan
		ON Bor.CardNo = Loan.CardNo
		GROUP BY Bor.Name, Bor.[Address], Bor.Phone
		HAVING COUNT(*) > 5
		
	IF @query = 7
		SELECT Book.Title, Cop.No_Of_Copies
		FROM Book_Authors AS Auth
		INNER JOIN Book
		ON Auth.BookId = Book.BookId
		INNER JOIN Book_Copies AS Cop
		ON Book.BookId = Cop.BookId
		INNER JOIN Library_Branch AS Bran
		ON Cop.BranchId = Bran.BranchId
		WHERE Auth.AuthorName LIKE '%Stephen King%'
		AND Bran.BranchName = 'Central'