using Xunit;
using MidtermWebApp.Controllers;
using Microsoft.AspNetCore.Mvc;

namespace MidtermWebApp.Tests
{
    public class FeedbackControllerTests
    {
        [Fact]
        public void Index_Get_ReturnsViewResult()
        {
            // Arrange
            var controller = new FeedbackController();

            // Act
            var result = controller.Index();

            // Assert
            Assert.IsType<ViewResult>(result);
        }
    }
}
