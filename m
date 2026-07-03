Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B79346769;
	Fri,  3 Jul 2026 14:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783088364; cv=none; b=kwW2Q6QYlgHyd4QK9JZIVxXzFvlSs4KWxzBViFrEzkiHbLQtSfdz6clANImxMO1JMColv7ykOxh3z0g+vXW9nUfCc6/RsaYqItkOtiCce7e7LcomPDj5CfqXWp9KmiD0GuOwZNd8o3Jr/EpxGf13ABbT19wHsU/Sd2cEDJZG/i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783088364; c=relaxed/simple;
	bh=3WI9Og/sH3O3URsSjGsyAPXt+IBbkqGGb/mVwusVlBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VsvW/+EUbFv1pYN96VnyPIizfktZ6hnCEcSrPgMNKndRcmkL8gVjw04HYINvMSBWtXHTSriOY2QwSe8JLeQ3yPAbDYD0oJ/onfEQ0WRHXg/JwM8OwByZch83rVMX9LW4whCT/xfLzwbCEJhADF7/WXGMHcbMHNmw42Cc3Mens38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACuoiLw+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACuoiLw+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD461F000E9;
	Fri,  3 Jul 2026 14:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783088363;
	bh=H/pY379yEp2lOmdP4C0Z6JIWkDx1GiP2307SZe16gLA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ACuoiLw+PBVIzBrWKvIoNo05VcH7C/YELcrVEvtlUG/0yUjz4zdPeAChwsYJ+wAyW
	 3Ih4/iNLP2lsr4Bohpo8k8359ISyss15W5oiRjloFjJdYC+frHwNVL3jWntHPeOBzT
	 3OLnRjs7F2jsRN39p9EIMdAyBfUxv5Bs2sXC+RP7sE4eMLsOg0ws77uZSc51L1XyBe
	 2/2AqICf+c9XX+VsWMOdi9vRGu3luRtNuRBow2Y/PvSQogmWw3iDlw2L1bwt4VX5dv
	 g/J5/ctC/DxsfdqcT6rosI/zvTtKZakhJjJGKhXVBgX8nnAvHB1r9xGsALjDbZnr0c
	 PsYKnmvhysj9Q==
Message-ID: <3e7a26e0-5ba5-4440-acd1-ac9547e1d403@kernel.org>
Date: Fri, 3 Jul 2026 16:19:19 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] soc: apple: Add driver for Apple PMGR misc
 controls
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
 Hector Martin <marcan@marcan.st>, Neal Gompa <neal@gompa.dev>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20260703-pmgr-misc-v2-0-4b26ba10c5a4@chaosmail.tech>
 <20260703-pmgr-misc-v2-2-4b26ba10c5a4@chaosmail.tech>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260703-pmgr-misc-v2-2-4b26ba10c5a4@chaosmail.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Just a few nits in case you need another version, this otherwise looks 
good to me


On 7/3/26 14:44, Sasha Finkelstein wrote:
> From: Hector Martin <marcan@marcan.st>
>
> Apple SoCs have PMGR blocks that control a bunch of power-related
> features. Besides the existing device power state controls (which are
> very uniform and handled by apple-pmgr-pwrstate), we also need to manage
> more random registers such as SoC-wide fabric and memory controller
> power states, which have a different interface.
>
> Add a driver for these kitchen sink controls. Right now it implements
> fabric and memory controller power state switching on system
> standby/s2idle, which saves about 1W of power or so on t60xx platforms.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Sasha Finkelstein <k@chaosmail.tech>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---

[...]

> @@ -0,0 +1,179 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Apple SoC PMGR device power state driver
> + *
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/bitfield.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
this should be a few lines up to keep the includes in alphabetical order

> +
> +#define APPLE_CLKGEN_PSTATE 0
> +#define APPLE_CLKGEN_PSTATE_DESIRED GENMASK(3, 0)
> +
[...]
> +
> +static void apple_pmgr_sys_dev_set_pstate(struct apple_pmgr_misc *misc,
> +					  enum sys_device dev, bool active)
> +{
> +	u32 pstate;
> +	u32 val;
> +
> +	if (!misc->devices[dev].base)
> +		return;
> +
> +	if (active)
> +		pstate = misc->devices[dev].active_state;
> +	else
> +		pstate = misc->devices[dev].suspend_state;
> +
> +	dev_dbg(misc->dev, "set %d ps to pstate %d\n", dev, pstate);
> +
> +	val = readl_relaxed(misc->devices[dev].base + APPLE_CLKGEN_PSTATE);
> +	val &= ~APPLE_CLKGEN_PSTATE_DESIRED;
> +	val |= FIELD_PREP(APPLE_CLKGEN_PSTATE_DESIRED, pstate);
> +	writel_relaxed(val, misc->devices[dev].base + APPLE_CLKGEN_PSTATE);

There's also FIELD_MODIFY now.

> +}
> +
[...]
> +
> +static const struct apple_pmgr_misc_hw apple_pmgr_misc_hw_t600x = {
> +	.dev_min_ps = {
> +		[DEV_FABRIC] = SYS_DEV_PSTATE_SUSPEND,
> +		[DEV_DCS] = 7,

Do we know what 7 means here? would be nice to also have that #defined

Either way,

Reviewed-by: Sven Peter <sven@kernel.org>


Best,


Sven



