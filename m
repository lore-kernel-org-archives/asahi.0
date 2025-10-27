Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E262D7DED;
	Mon, 27 Oct 2025 19:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761593527; cv=none; b=L56EqG6bCfS5Bhha7To+F2mSgdTchjsYHJjrJ48LR02hVOOv5yhRSPWujcTpACqWbWz/gcmtZvKmEIZtCKlJorCu4aId5xzCx28DbGH4PVL/UaYgC7jDtrmFvn7nt3Ab8SbzFxEnuOec0tH6ZoLn7nM/ohY1X+6zMkB6foATRAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761593527; c=relaxed/simple;
	bh=oEIFLwg+vMtiQ/y1rzQR0wldto4rWaop80M5IVc5VzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q26eFr0olb0Fc5+0+qbFSgUjMpmMC+J2HVYDh81qTXSdWPXqm8YavhCnJSkWeTp3BgDPFBZGSrAw55RdpcJpTgAQym2AvMMYH3YTabkG0XqBvWgSo8RzhI0yZ/rqqfkOef/FaV1WhkBgHsMgJx4bWv5sMpe0erXc0Qm8Y7c8/XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k6pNEWwM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k6pNEWwM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919B0C4CEF1;
	Mon, 27 Oct 2025 19:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761593527;
	bh=oEIFLwg+vMtiQ/y1rzQR0wldto4rWaop80M5IVc5VzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k6pNEWwMLGvzAWBWoBmVLQ+XdDyjFHAhvOCxXgwSXTxBKWO5/NuLWhQKkihLEX7aP
	 LKgI7G4lkBamHGgtANCDrX8H+tIL19Z79B0S53yciHqFxh/KAA97KGAAebgCdrEJqT
	 LIs/uAa4dG2KF0RnGNfNi9FwqOc7ybIb4JbeCgAy6OxHtn8CpmfErUtv91zMLoLeha
	 cXxu/KlUZKSjrHXUghfEq3uknJmfbwkgXH83ieKob3ixLtD4nTzLdBF7BMgEYdZjWb
	 mRkVcIEj2udzuYnwXuariKZOpOBhpxODdUJJWQXMlacISX+Pp2vwI6QAXHPGtaE0/V
	 NYEL3/2/SNCyA==
Date: Mon, 27 Oct 2025 14:32:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Neal Gompa <neal@gompa.dev>,
	linux-arm-kernel@lists.infradead.org, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH 2/3] dt-bindings: phy: Add Apple Type-C PHY
Message-ID: <176159352279.1458022.4288702383335406769.robh@kernel.org>
References: <20251026-b4-atcphy-v1-0-f81b1225f9c6@kernel.org>
 <20251026-b4-atcphy-v1-2-f81b1225f9c6@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026-b4-atcphy-v1-2-f81b1225f9c6@kernel.org>


On Sun, 26 Oct 2025 13:52:02 +0000, Sven Peter wrote:
> Apple's Type-C PHY (ATCPHY) is a PHY for USB 2.0, USB 3.x,
> USB4/Thunderbolt, and DisplayPort connectivity found in Apple Silicon
> SoCs.
> 
> The PHY handles muxing between these different protocols and also provides
> the reset controller for the attached dwc3 USB controller.
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  .../devicetree/bindings/phy/apple,atcphy.yaml      | 222 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 223 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

