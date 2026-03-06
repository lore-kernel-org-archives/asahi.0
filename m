Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BA8207A20;
	Fri,  6 Mar 2026 00:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772757022; cv=none; b=srhtPs09ZqvQJS81DZYK0yHYh+AIqzO2wOODqDumh+/qXHJG1QVjelCjgYNB2lr0MXhYgfkngAelkkUE/YoK9qn5/kdX6+NXxDY+x6rgUGx+eLTMNW6dXnZFqnQfGf9a65PX40vMjkzkBRM+RctSmBpcihu9i2mq7yHz4xZ1aU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772757022; c=relaxed/simple;
	bh=vmwInn4SskmODHI1zr76dOW2u1eZLDAg1ejAi8dpHnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swhIBlZOV7OaSfsLdKhy0wcCZYzzHYMy6OHsivgqwdLfdBkggf+LqKzg2g/gbOV17ugvruEnqt/cin51mftPQXtQxcw52q8Xq2IFGWQEQqUBgk8zG2i53svstYo9knKGImB1da5V7E+t8RZkmrPKqMNIvWISETM1mB6bfxMZWWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tgXwyVFo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tgXwyVFo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D49C116C6;
	Fri,  6 Mar 2026 00:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772757021;
	bh=vmwInn4SskmODHI1zr76dOW2u1eZLDAg1ejAi8dpHnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tgXwyVFo+Emg12wFLR/syV9eMcecLnNwpIHV4W1evV5VsMhIuOrpQJzt8FLE0erVO
	 +mjO1bgKYA0kFwyiY+BJNT453FdxOf5GhdRx+a5NnNBNiLUdxqYvioe1YTMDwIkdna
	 GH2WxnIj4lXR/P4gyY6MZmBUZC9a0lQEImh0AhmfAIfZ8m94RJ3cfK7M/XkEnWVWtD
	 VLBuOSph5JXU9D/i4l3nlJY6Rmk8BLrDezGG8EpRewP0KDaOwMgh45OLFGA0DZCCDH
	 uQptw3s+ingmJ1IGSXaIqQg5zNI3MnHv1yCbQqI0PU1O03l7s5+87M0rx6lNuLag5A
	 6qpfdWdggNbTA==
Date: Thu, 5 Mar 2026 18:30:20 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Thomas Gleixner <tglx@kernel.org>, Sven Peter <sven@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Neal Gompa <neal@gompa.dev>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, asahi@lists.linux.dev
Subject: Re: [PATCH v3 1/2] dt-bindings: interrupt-controller: apple,aic2:
 Add AICv3
Message-ID: <177275702044.855774.12868970786032244233.robh@kernel.org>
References: <20260223-irq-apple-aic3-v3-0-2b7328076b8d@jannau.net>
 <20260223-irq-apple-aic3-v3-1-2b7328076b8d@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-irq-apple-aic3-v3-1-2b7328076b8d@jannau.net>


On Mon, 23 Feb 2026 21:42:46 +0100, Janne Grunau wrote:
> AIC version 3 as found on the Apple M3 (t8122) is very similar to AICv2
> in its base functionality. It can use the same device tree bindings as
> AICv2 so add it to the AICv2 bindings.
> This interrupt controller is used on all Apple SoCs starting with M3 up
> to at least M5.
> The only apparent difference is the increased IRQ config offset. Apple's
> device tree codes this new offset as property of the "aic" node but the
> value stayed constant for all SoCs with "aic,3". Since the SoC specific
> compatible "apple,t8122-aic3" will be used in the driver this offset can
> remain a driver implementation detail.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  .../bindings/interrupt-controller/apple,aic2.yaml  | 30 +++++++++++++++-------
>  1 file changed, 21 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

