Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BEB8469
	for <asahi@lists.linux.dev>; Sun, 10 Sep 2023 19:05:27 +0000 (UTC)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
	id 0A026270477; Sun, 10 Sep 2023 20:58:48 +0200 (CEST)
Date: Sun, 10 Sep 2023 20:58:48 +0200
From: Janne Grunau <j@jannau.net>
To: Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH] drm/simpledrm: Add support for multiple "power-domains"
Message-ID: <ZP4R6KKglD55jj0A@jannau.net>
References: <20230910-simpledrm-multiple-power-domains-v1-1-f8718aefc685@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230910-simpledrm-multiple-power-domains-v1-1-f8718aefc685@jannau.net>

On 2023-09-10 18:39:39 +0200, Janne Grunau via B4 Relay wrote:
> From: Janne Grunau <j@jannau.net>
> 
> Multiple power domains need to be handled explicitly in each driver. The
> driver core can not handle it automatically since it is not aware of
> power sequencing requirements the hardware might have. This is not a
> problem for simpledrm since everything is expected to be powered on by
> the bootloader. simpledrm has just ensure it remains powered on during
> its lifetime.
> This is required on Apple silicon M2 and M2 Pro/Max/Ultra desktop
> systems. The HDMI output initialized by the bootloader requires keeping
> the display controller and a DP phy power domain on.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/gpu/drm/tiny/simpledrm.c | 106 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 106 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> index ff86ba1ae1b8..efedede57d42 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -6,6 +6,7 @@
>  #include <linux/of_address.h>
>  #include <linux/platform_data/simplefb.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>  #include <linux/regulator/consumer.h>
>  
>  #include <drm/drm_aperture.h>
> @@ -227,6 +228,12 @@ struct simpledrm_device {
>  	unsigned int regulator_count;
>  	struct regulator **regulators;
>  #endif
> +	/* power-domains */
> +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
> +	int pwr_dom_count;
> +	struct device **pwr_dom_devs;
> +	struct device_link **pwr_dom_links;
> +#endif
>  
>  	/* simplefb settings */
>  	struct drm_display_mode mode;
> @@ -468,6 +475,102 @@ static int simpledrm_device_init_regulators(struct simpledrm_device *sdev)
>  }
>  #endif
>  
> +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
> +/*
> + * Generic power domain handling code.
> + *
> + * Here we handle the power-domains properties of our "simple-framebuffer"
> + * dt node. This is only necessary if there is more than one power-domain.
> + * A single power-domains is handled automatically by the driver core. Multiple
> + * power-domains have to be handled by drivers since the driver core can't know
> + * the correct power sequencing. Power sequencing is not an issue for simpledrm
> + * since the bootloader has put the power domains already in the correct state.
> + * simpledrm has only to ensure they remain active for its lifetime.
> + *
> + * When the driver unloads, we detach from the power-domains.
> + *
> + * We only complain about errors here, no action is taken as the most likely
> + * error can only happen due to a mismatch between the bootloader which set
> + * up the "simple-framebuffer" dt node, and the PM domain providers in the
> + * device tree. Chances are that there are no adverse effects, and if there are,
> + * a clean teardown of the fb probe will not help us much either. So just
> + * complain and carry on, and hope that the user actually gets a working fb at
> + * the end of things.
> + */
> +static void simpledrm_device_detach_genpd(void *res)
> +{
> +	int i;
> +	struct simpledrm_device *sdev = /*(struct simpledrm_device *)*/res;

commented cast, removed locally for v2

> +
> +
> +	drm_err(&sdev->dev, "% power-domains count:%d\n", __func__, sdev->pwr_dom_count);

broken log statement as pointed out by kernel test robot, not ment to be 
included in this change. removed locally for v2

> +	if (sdev->pwr_dom_count <= 1)
> +		return;
> +
> +	for (i = sdev->pwr_dom_count - 1; i >= 0; i--) {
> +		if (!sdev->pwr_dom_links[i])
> +			device_link_del(sdev->pwr_dom_links[i]);
> +		if (!IS_ERR_OR_NULL(sdev->pwr_dom_devs[i]))
> +			dev_pm_domain_detach(sdev->pwr_dom_devs[i], true);
> +	}
> +}
> +
> +static int simpledrm_device_attach_genpd(struct simpledrm_device *sdev)
> +{
> +	struct device *dev = sdev->dev.dev;
> +	int i;
> +
> +	sdev->pwr_dom_count = of_count_phandle_with_args(dev->of_node, "power-domains",
> +							 "#power-domain-cells");
> +	/*
> +	 * Single power-domain devices are handled by driver core nothing to do
> +	 * here. The same for device nodes without "power-domains" property.
> +	 */
> +	if (sdev->pwr_dom_count <= 1)
> +		return 0;
> +
> +	sdev->pwr_dom_devs = devm_kcalloc(dev, sdev->pwr_dom_count,
> +					       sizeof(*sdev->pwr_dom_devs),
> +					       GFP_KERNEL);
> +	if (!sdev->pwr_dom_devs)
> +		return -ENOMEM;
> +
> +	sdev->pwr_dom_links = devm_kcalloc(dev, sdev->pwr_dom_count,
> +						sizeof(*sdev->pwr_dom_links),
> +						GFP_KERNEL);
> +	if (!sdev->pwr_dom_links)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < sdev->pwr_dom_count; i++) {
> +		sdev->pwr_dom_devs[i] = dev_pm_domain_attach_by_id(dev, i);
> +		if (IS_ERR(sdev->pwr_dom_devs[i])) {
> +			int ret = PTR_ERR(sdev->pwr_dom_devs[i]);
> +			if (ret == -EPROBE_DEFER) {
> +				simpledrm_device_detach_genpd(sdev);
> +				return PTR_ERR(sdev->pwr_dom_devs[i]);
> +			}
> +			drm_err(&sdev->dev,
> +				"pm_domain_attach_by_id(%u) failed: %d\n", i, ret);
> +		}
> +
> +		sdev->pwr_dom_links[i] = device_link_add(dev,
> +							 sdev->pwr_dom_devs[i],
> +							 DL_FLAG_STATELESS |
> +							 DL_FLAG_PM_RUNTIME |
> +							 DL_FLAG_RPM_ACTIVE);
> +		if (!sdev->pwr_dom_links[i])
> +			drm_err(&sdev->dev, "failed to link power-domain %u\n", i);

wrong format specifier for int, fixed locally for v2

Janne
