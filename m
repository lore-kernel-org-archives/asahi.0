Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC64A2248B5
	for <asahi@lists.linux.dev>; Thu,  6 Feb 2025 07:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738828388; cv=none; b=sXNa0ZrW0SwbHleA7Jda/XTZxKd9sdYOvgoVt3mQIFgh1Zy9LgWppv5uRo9IkVq3a12R4cNbLZef4BdiGiqiHTkRYe8dIP+D7oSWa1cQ9U+Q2opl/fbLyjI7rVLHYzj2Vy7h2eZErerZj3w8oiKBMIQiFt4xUqbOZBA3HMVQNYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738828388; c=relaxed/simple;
	bh=m3pqvKmJ/Z8qndxmifJJzHfJ8SakGeyV+JdUcnde8xc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hgMpQ17S0DA30JTTEi9HL6/83MJKNuiBAtqrWybdmxepJRSZTXUlkNEOW9JU5n3HwDDR6/tTFYpn+Z332t55q96OH9jL+0tQxtrerFSwy9jrCdPz654hEr9uWODxWwl2B/0fFX6nlmAUW2KWoWrbLkR7iS0LaJYZsVij+w4HXJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=thg0WThE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="thg0WThE"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so5541535e9.1
        for <asahi@lists.linux.dev>; Wed, 05 Feb 2025 23:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738828384; x=1739433184; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6m7TXnR8Yp1Zl6pcqMtLySEDyoW+PZY7jbi3ZwdEqTE=;
        b=thg0WThE0a/EgJRJ032Fl94c0v191PN/5ImwhSh8J5HrxpSxv+8vGKsfocGbQQ8+CJ
         kSWVweiRarMJoDUNkH+PO4hdedFtODWqxr9rE14fI/xPTHjT8rVgXRXyZxYmbo3Zkx9w
         QmunXX21iQSAaUyv0xdC10Erxd+r6uXw3TEzAWrNmzDrV95/2HnsvFgCZNl54IAg8JkW
         s/MvJiTYhJVc8C5HmPDAHL1qTNBXRTiUGB654G3XHK3bWZOSLPCDB/RSDycYpBu+DN3r
         xmmQPHs9avUTUjoVHpsVUQg+Uh4L5GHjHmdbqLQrEHxr6O1WuqedB63aH116Pype7ffa
         uLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738828384; x=1739433184;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6m7TXnR8Yp1Zl6pcqMtLySEDyoW+PZY7jbi3ZwdEqTE=;
        b=uqC5E++NfemU2hG7Z076WfkTYAxRgfx2GTwiJXKP2T1Qz7A5/D7N/AHbU7gJ+PvJK8
         fz7BLMxxg++KuZijMlHMeZrHY0PT6zFmwJssKnH1VcrBlT0vHfz0zCUDZim5vLB2Hue2
         wP47W8N4qC01vBUoDUh6T+jQpW2QmFP0J899MBQMiHNnZniw6YNi4ymJan7XagAX82xG
         /7YCNVBg5Wyk+fF9amdQblJZ/mGijQMEV3aCR3FZ85CbD3IdVrzsZgRSsR1nZpZAiDP2
         wDQmDinIGEay4Llawt5/IFIUe2pdlDkTuX2vnPEKta7vu94B7R5XgV5OhSiXOaDmHFzC
         aHiw==
X-Forwarded-Encrypted: i=1; AJvYcCWA+hiWvcpq3AVfiILswNF6jcngLFWv9mE0LSGKBmTP1NnDR6uLpcpdY6JUB3sm6DN1n1qdAA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxN608JLMNGrAgJ/6so0P/dBwXxKGlurCUpiYGm0NkL4WRfCV4z
	31WFx8MkDVK64Oj2Kt1hXy8BIrbXVUTaxebr2JeTrFBOI8f4V/2KvfS1OAtyhYE=
X-Gm-Gg: ASbGncumjubHnvBGa9lPQ0T9QCMbiyyemJjBKgl7AtMNEzoKFSwkjGTyotlGk8sDQp3
	kE6SEUQJQMYtAHQCTKaAXWjBMidZNUyhraQ1DNxHG2tt1wb/IRWw3ks0Fuud/CG37YsuN2mu00q
	OjPeWX0b1LTpGcDZKXzmA05QgkQJV1IhW0VsQ097yTVNIJPe3VkWoOB0sXxS2WbM4tOWQj5pjAw
	uZ+M7YkvyayxDH9mwl8gT1h4OyrMjBS2C85xcYiaJFjJPUobt/RxqszGJYXgwwqDN4weFuwb/iS
	Ms6IvX7a8rdouzqbvZmJFqfiVI+fkQo0DhG9s3ja+mk9gAP2pMsYvNuU6p4G8b8h8h0M
X-Google-Smtp-Source: AGHT+IH0RqYwjPbaACsjDyFw9S+aalsLTtgB2h+Skh1qS7c10wBFGD0+SWpJDenUFZCuNvQ5UxMfHQ==
X-Received: by 2002:a05:600c:4ec8:b0:436:9227:915 with SMTP id 5b1f17b1804b1-4390d434838mr44861015e9.9.1738828384159;
        Wed, 05 Feb 2025 23:53:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6? ([2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dcae5c7sm10442625e9.18.2025.02.05.23.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 23:53:03 -0800 (PST)
Message-ID: <2a602642-7c18-4969-ae41-8d24bcacac45@linaro.org>
Date: Thu, 6 Feb 2025 08:53:02 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 3/5] drm: panel: Add a panel driver for the Summit
 display
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alyssa Ross <hi@alyssa.is>, Nick Chan <towinchenmi@gmail.com>
References: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
 <20250205-adpdrm-v5-3-4e4ec979bbf2@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250205-adpdrm-v5-3-4e4ec979bbf2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/2025 23:10, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> This is the display panel used for the touchbar on laptops that have it.
> 
> Co-developed-by: Nick Chan <towinchenmi@gmail.com>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>   drivers/gpu/drm/panel/Kconfig        |   9 +++
>   drivers/gpu/drm/panel/Makefile       |   1 +
>   drivers/gpu/drm/panel/panel-summit.c | 132 +++++++++++++++++++++++++++++++++++
>   3 files changed, 142 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index d7469c565d1db8b8e974dd6c45d03d9352d99d63..5085a82e4bc695e85cabbc3200859bbe10cb0f91 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -925,6 +925,15 @@ config DRM_PANEL_SIMPLE
>   	  that it can be automatically turned off when the panel goes into a
>   	  low power state.
>   
> +config DRM_PANEL_SUMMIT
> +	tristate "Apple Summit display panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y if you want to enable support for the "Summit" display panel
> +	  used as a touchbar on certain Apple laptops.
> +
>   config DRM_PANEL_SYNAPTICS_R63353
>   	tristate "Synaptics R63353-based panels"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 7dcf72646cacff11bab90c78e3b8b1f357e5f14a..10ac2e850f5cd6d6546439de75483466e4015d1a 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -89,6 +89,7 @@ obj-$(CONFIG_DRM_PANEL_SHARP_LS060T1SX01) += panel-sharp-ls060t1sx01.o
>   obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) += panel-sitronix-st7701.o
>   obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
>   obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
> +obj-$(CONFIG_DRM_PANEL_SUMMIT) += panel-summit.o
>   obj-$(CONFIG_DRM_PANEL_SYNAPTICS_R63353) += panel-synaptics-r63353.o
>   obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
>   obj-$(CONFIG_DRM_PANEL_SONY_TD4353_JDI) += panel-sony-td4353-jdi.o
> diff --git a/drivers/gpu/drm/panel/panel-summit.c b/drivers/gpu/drm/panel/panel-summit.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..fb084f280c6fa3197b64876edd03172dbdf962b3
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-summit.c
> @@ -0,0 +1,132 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/backlight.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_mode.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <video/mipi_display.h>
> +
> +struct summit_data {
> +	struct mipi_dsi_device *dsi;
> +	struct backlight_device *bl;
> +	struct drm_panel panel;
> +};
> +
> +static int summit_set_brightness(struct device *dev)
> +{
> +	struct summit_data *s_data = dev_get_drvdata(dev);
> +	int level = backlight_get_brightness(s_data->bl);
> +
> +	return mipi_dsi_dcs_set_display_brightness(s_data->dsi, level);
> +}
> +
> +static int summit_bl_update_status(struct backlight_device *dev)
> +{
> +	return summit_set_brightness(&dev->dev);
> +}
> +
> +static const struct backlight_ops summit_bl_ops = {
> +	.update_status	= summit_bl_update_status,
> +};
> +
> +static int summit_get_modes(struct drm_panel *panel,
> +			    struct drm_connector *connector)
> +{
> +	struct drm_display_mode *mode = drm_mode_create(connector->dev);
> +
> +	connector->display_info.non_desktop = true;
> +	drm_object_property_set_value(&connector->base,
> +				      connector->dev->mode_config.non_desktop_property,
> +				      connector->display_info.non_desktop);
> +
> +	mode->vdisplay = 2008;
> +	mode->hdisplay = 60;
> +	mode->hsync_start = mode->hdisplay + 8;
> +	mode->hsync_end = mode->hsync_start + 80;
> +	mode->htotal = mode->hsync_end + 40;
> +	mode->vsync_start = mode->vdisplay + 1;
> +	mode->vsync_end = mode->vsync_start + 15;
> +	mode->vtotal = mode->vsync_end + 6;
> +	mode->clock = (mode->vtotal * mode->htotal * 60) / 1000;
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	mode->flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC;
> +	drm_mode_set_name(mode);
> +	drm_mode_probed_add(connector, mode);
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs summit_panel_funcs = {
> +	.get_modes = summit_get_modes,
> +};
> +
> +static int summit_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct backlight_properties props = { 0 };
> +	struct device *dev = &dsi->dev;
> +	struct summit_data *s_data;
> +	int ret;
> +
> +	s_data = devm_kzalloc(dev, sizeof(*s_data), GFP_KERNEL);
> +	if (!s_data)
> +		return -ENOMEM;
> +
> +	mipi_dsi_set_drvdata(dsi, s_data);
> +	s_data->dsi = dsi;
> +
> +	ret = device_property_read_u32(dev, "max-brightness", &props.max_brightness);
> +	if (ret)
> +		return ret;
> +	props.type = BACKLIGHT_RAW;
> +
> +	s_data->bl = devm_backlight_device_register(dev, dev_name(dev),
> +						    dev, s_data, &summit_bl_ops, &props);
> +	if (IS_ERR(s_data->bl))
> +		return PTR_ERR(s_data->bl);
> +
> +	drm_panel_init(&s_data->panel, dev, &summit_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +	drm_panel_add(&s_data->panel);
> +
> +	return mipi_dsi_attach(dsi);
> +}
> +
> +static void summit_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct summit_data *s_data = mipi_dsi_get_drvdata(dsi);
> +
> +	mipi_dsi_detach(dsi);
> +	drm_panel_remove(&s_data->panel);
> +}
> +
> +static int summit_suspend(struct device *dev)
> +{
> +	struct summit_data *s_data = dev_get_drvdata(dev);
> +
> +	return mipi_dsi_dcs_set_display_brightness(s_data->dsi, 0);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(summit_pm_ops, summit_suspend,
> +				summit_set_brightness);
> +
> +static const struct of_device_id summit_of_match[] = {
> +	{ .compatible = "apple,summit" },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, summit_of_match);
> +
> +static struct mipi_dsi_driver summit_driver = {
> +	.probe = summit_probe,
> +	.remove = summit_remove,
> +	.driver = {
> +		.name = "panel-summit",
> +		.of_match_table = summit_of_match,
> +		.pm = pm_sleep_ptr(&summit_pm_ops),
> +	},
> +};
> +module_mipi_dsi_driver(summit_driver);
> +
> +MODULE_DESCRIPTION("Summit Display Panel Driver");
> +MODULE_LICENSE("GPL");
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
