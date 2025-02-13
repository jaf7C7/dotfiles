/* Custom formatter for `eslint`.
 *
 * Reports errors in the format: `<file>:<line>:<column>: <message>`
 *
 * See:
 *	https://eslint.org/docs/latest/extend/custom-formatters
 *	https://www.gnu.org/prep/standards/html_node/Errors.html
 */
export default function (results, context) {
	return results.forEach((result) => {
		result.messages.forEach((message) => {
			return(
				`${result.filePath}:${message.line}:${message.column}: ` +
				`${message.message} (${message.ruleId})\n`,
			);
		});
	});
};
