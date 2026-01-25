Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43F631A808;
	Sun, 25 Jan 2026 11:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769341362; cv=none; b=jQVN7ETYA/iEYSkFaKrUInIovyNZCwvMKh+Uw4AEHfYLtXmaoDstnmSd30W046BAjtJAPImda+oNvDAbIZNzXJF4eVgAOncqm8j3ajuF3b4Ob5SQ88MfDL7BXdzHxL8VVg6AoEAh+sqUejfIGK8KB4t1WjOYfTetwOJ85V7deDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769341362; c=relaxed/simple;
	bh=4DdLprG/N7B62TK2LkKPFjtgMnqQxVpNxf7Fn2cCd84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iS+26biKyMUKQiySHV6uBLpsljTcxTtuiYCa6HTwVd/W+/95LOMx4BiM8NT2/1XTauW80E1NyPpM7KKrNoLyA/VEtjXJ+rklxta2wwDB4z+DZDx/lmh1gdjP4Ci74F048bdyoncr5HzIUWVf2Vk0UynRsjsKxYLX1g83ydgUL0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dTYlM7XM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dTYlM7XM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD68C4CEF1;
	Sun, 25 Jan 2026 11:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769341362;
	bh=4DdLprG/N7B62TK2LkKPFjtgMnqQxVpNxf7Fn2cCd84=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dTYlM7XMLjH+fCGMjb69wP2JlH+AS3ssBeZldr0a2T3sofB0ofge07nmOb9uFOIsa
	 TsRyz9MYQ+K0pbJ9hoIyQ/OpHkZyigK8AOKarVQoJyZwn4z+xV1LgtgpAJsmOBhRFR
	 8rquwBUSrag/f5EVMhYJ0O+gvS2ukd88UsJfl/bIaVKuxWWPUcdekkDkonbbIOCiJM
	 XC86ej2O5f51PNlByt1uuKmU/QhkaYuV8Czg0LyTfl/3S6Amb++1NC9cEMtdTnika6
	 AAG9Lq9mInJoGVudstMOxBMiL3ifQwlU8Pn19kAQs/9UeQZAVul0Fg5RYf+JQ2/xmi
	 Otdo7jSdLxu7A==
Message-ID: <5d4ef8fd-55c1-42c3-a18d-a262997ec302@kernel.org>
Date: Sun, 25 Jan 2026 12:42:38 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] irqchip/apple-aic: Add support for "apple,t8122-aic3"
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260125-irq-apple-aic3-v1-0-a2afe66a6ab9@jannau.net>
 <20260125-irq-apple-aic3-v1-2-a2afe66a6ab9@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260125-irq-apple-aic3-v1-2-a2afe66a6ab9@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.01.26 12:08, Janne Grunau wrote:
> Introduce support for the new AICv3 hardware block in t8122 and t603x
> SoCs. AICv3 is similar to AICv2 but has an increased IRQ config offset.
> These MMIO offsets are coded as properties of the "aic,3" node in
> Apple's device tree. The actual offsets are the same for all SoCs
> starting from M3 through at least M5. So do not bother to follow suit
> but use AICv3 specific defines in the driver.
> The compatible string is SoC specific so future SoCs with AICv3 and
> different offsets would just use their own compatible string as base and
> add their new offsets.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>   drivers/irqchip/irq-apple-aic.c | 27 +++++++++++++++++++++++++--
>   1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
> index 3c70364e7cddd6ed6285595f136146ab04b897b2..f4efc325bebad1ae6119aa4eab47819a267da207 100644
> --- a/drivers/irqchip/irq-apple-aic.c
> +++ b/drivers/irqchip/irq-apple-aic.c
> @@ -54,6 +54,7 @@
>   #include <linux/irqdomain.h>
>   #include <linux/jump_label.h>
>   #include <linux/limits.h>
> +#include <linux/of.h>

Did we miss this include previously or why is it added now?

Looks good to me otherwise:

Reviewed-by: Sven Peter <sven@kernel.org>


Best,


Sven

