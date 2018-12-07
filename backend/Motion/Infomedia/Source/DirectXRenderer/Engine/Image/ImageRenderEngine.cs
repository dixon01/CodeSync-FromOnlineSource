// --------------------------------------------------------------------------------------------------------------------
// <copyright file="ImageRenderEngine.cs" company="Gorba AG">
//   Copyright � 2011-2014 Gorba AG. All rights reserved.
// </copyright>
// <summary>
//   Defines the ImageRenderEngine type.
// </summary>
// --------------------------------------------------------------------------------------------------------------------

namespace Gorba.Motion.Infomedia.DirectXRenderer.Engine.Image
{
    using System.Drawing;

    using Gorba.Common.Configuration.Infomedia.Layout;
    using Gorba.Motion.Infomedia.Entities.Screen;
    using Gorba.Motion.Infomedia.RendererBase.Engine;
    using Gorba.Motion.Infomedia.RendererBase.Manager;

    /// <summary>
    /// The image render engine.
    /// </summary>
    public class ImageRenderEngine
        : RenderEngineBase<ImageItem,
                           IImageRenderEngine<IDxDeviceRenderContext>,
                           ImageRenderManager<IDxDeviceRenderContext>>,
          IImageRenderEngine<IDxDeviceRenderContext>
    {
        private ImageSprite oldSprite;
        private ImageSprite newSprite;

        /// <summary>
        /// Initializes a new instance of the <see cref="ImageRenderEngine"/> class.
        /// </summary>
        /// <param name="manager">
        /// The manager.
        /// </param>
        public ImageRenderEngine(ImageRenderManager<IDxDeviceRenderContext> manager)
            : base(manager)
        {
        }

        /// <summary>
        /// Renders the object represented by this engine.
        /// </summary>
        /// <param name="alpha">
        /// The alpha value (0 = transparent, 1 = opaque).
        /// </param>
        /// <param name="context">
        /// The rendering context.
        /// </param>
        protected override void DoRender(double alpha, IDxDeviceRenderContext context)
        {
            if (this.oldSprite == null)
            {
                this.oldSprite = new ImageSprite(this.Manager, context);
            }

            if (this.newSprite == null)
            {
                this.newSprite = new ImageSprite(this.Manager, context);
            }

            var oldFilename = this.Manager.Filename.OldValue;
            var newFilename = this.Manager.Filename.NewValue;

            var bounds = this.Manager.Bounds;
            bounds.X += this.Viewport.X;
            bounds.Y += this.Viewport.Y;

            if (oldFilename != null)
            {
                if (this.oldSprite.CurrentFilename != oldFilename
                    && this.newSprite.CurrentFilename == oldFilename)
                {
                    // swap sprites
                    var sprite = this.oldSprite;
                    this.oldSprite = this.newSprite;
                    this.newSprite = sprite;
                }

                this.oldSprite.Setup(oldFilename);
                this.oldSprite.Render(
                    bounds, this.Manager.Scaling, (int)(255 * alpha * this.Manager.Filename.OldAlpha), context);
            }

            if (newFilename != null)
            {
                this.newSprite.Setup(newFilename);
                this.newSprite.Render(
                    bounds, this.Manager.Scaling, (int)(255 * alpha * this.Manager.Filename.NewAlpha), context);
            }
        }

        /// <summary>
        /// Override this method to be notified when a device is reset.
        /// If you have any DirectX resources, make sure to call
        /// OnResetDevice() on them if available.
        /// </summary>
        protected override void OnResetDevice()
        {
            base.OnResetDevice();
            if (this.oldSprite != null)
            {
                this.oldSprite.OnResetDevice();
            }

            if (this.newSprite != null)
            {
                this.newSprite.OnResetDevice();
            }
        }

        /// <summary>
        /// Override this method to be notified when a device is lost.
        /// If you have any DirectX resources, make sure to call
        /// OnLostDevice() on them if available.
        /// </summary>
        protected override void OnLostDevice()
        {
            base.OnLostDevice();
            if (this.oldSprite != null)
            {
                this.oldSprite.OnLostDevice();
            }

            if (this.newSprite != null)
            {
                this.newSprite.OnLostDevice();
            }
        }

        /// <summary>
        /// Releases all previously created DirectX resources.
        /// </summary>
        protected override void Release()
        {
            if (this.oldSprite != null)
            {
                this.oldSprite.Dispose();
                this.oldSprite = null;
            }

            if (this.newSprite != null)
            {
                this.newSprite.Dispose();
                this.newSprite = null;
            }
        }

        private class ImageSprite : Engine.Image.ImageSprite
        {
            private readonly ImageRenderManager<IDxDeviceRenderContext> manager;

            public ImageSprite(ImageRenderManager<IDxDeviceRenderContext> manager, IDxDeviceRenderContext context)
                : base(context)
            {
                this.manager = manager;
            }

            public override void Render(Rectangle bounds, ElementScaling scaling, int alpha, IDxRenderContext context)
            {
                if (this.manager.Blink && !context.BlinkOn)
                {
                    return;
                }

                base.Render(bounds, scaling, alpha, context);
            }
        }
    }
}