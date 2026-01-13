Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819CE30FC3E;
	Tue, 13 Jan 2026 07:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768288079; cv=none; b=m4pVQV+riYmLhL4QV5MRVAN9qKAAeRFiuuyg7bX3Mks3KZh4DIjZkQMgQPewW6+YDD5ln5bh7ZpESk7KaHo9ZKNjeU7WBHxPCDg/eYgGPatC+tADq7CRwTrIqNUXYZkfV3g3cT6wmQhmMfq+69FN6X8HeieQAgp3WuRliXjPoOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768288079; c=relaxed/simple;
	bh=F8U6Q68qUAatZhyd2d4JaNwkARmZ3sJ39aNTp5Upt8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nAhX7H/LyBOc/B1ei+7BFrKPG5CbD1HSb97IvDxilz+Zm9tiC4wpQZ7r/6FjL2g7+ba4sEm8mYYJuS5asQV1LKvbw/DXf4JEytHfKnBCZAAEJkX5Lnr0yqLoy+An0lpioYbftys5SHVCo1ZCeTz7Tv9+eA222GSIADEUgZnBX8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AfeK4P5i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AfeK4P5i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F179C116C6;
	Tue, 13 Jan 2026 07:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768288079;
	bh=F8U6Q68qUAatZhyd2d4JaNwkARmZ3sJ39aNTp5Upt8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AfeK4P5itnMZATgBjW473iT+a4FxGLVknDoFxwEPLg1Cw9za4CyKqGICmDBSVjxlp
	 q+tAEz9uR5q17/NHe6iDWjgNk0Xxa3PBkM87+65NJOwq/ZlSjoi24DRiU018TkGWPT
	 xcD2W5R92IbKrk28onhnt2cr0gTiopy78Pe27M8d1CUuk8qSCDvaDh3pl0GHXCiDei
	 F2u7UFsDQxbp5/96KQoFtuYlEofwoWxu4/o6ynHXMeF+riFhPNu1yEuXgjVRD89bg7
	 a7XpHs9DWHJEZR7Ycvjz0dYjCQ92HaENv/s4kYnAM/oAoPLjYExh4Dtn6NRX1vpsGo
	 LizXO4xjhM48A==
From: Sven Peter <sven@kernel.org>
To: Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>,
	R <rqou@berkeley.edu>
Subject: Re: [PATCH 0/3] arm64: dts: apple: Add integrated USB Type-C ports
Date: Tue, 13 Jan 2026 08:07:41 +0100
Message-ID: <176828797321.8477.14188625188804624753.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109-apple-dt-usb-c-atc-dwc3-v1-0-ce0e92c1a016@jannau.net>
References: <20260109-apple-dt-usb-c-atc-dwc3-v1-0-ce0e92c1a016@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 09 Jan 2026 15:07:03 +0100, Janne Grunau wrote:
> Now that all dependencies for USB 2.0 and 3.x support are either merged
> (tipd changes in v6.18, dwc3-apple in v6.19-rc1) or in linux-next (Apple
> Type-C PHY) prepare device tree changes to expose the ports.
> 
> Each port on Apple silicon devices is driven by a separate collection of
> hardware blocks. For USB 2.0 and 3.x the collection consists of:
> - Apple Type-C PHY, combo PHY for USB 2.0, USB 3.x, USB4/Thunderbolt and
>   DisplayPort
> - Synopsys Designware dwc3 USB controller
> - two DART iommu instances for dwc3
> - CD321x USB PD controller (similar to Ti's TPS6598x series)
> 
> [...]

Applied to AsahiLinux/linux (apple-soc/dt-6.20), thanks!

[1/3] arm64: dts: apple: t8103: Add nodes for integrated USB Type-C ports
      https://github.com/AsahiLinux/linux/commit/2b737cc5be70
[2/3] arm64: dts: apple: t8112: Add nodes for integrated USB Type-C ports
      https://github.com/AsahiLinux/linux/commit/b4f4054864e6
[3/3] arm64: dts: apple: t60xx: Add nodes for integrated USB Type-C ports
      https://github.com/AsahiLinux/linux/commit/e21c8e2e0276

Best regards,
-- 
Sven Peter <sven@kernel.org>

