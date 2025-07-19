Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0AC7404E;
	Sat, 19 Jul 2025 12:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752929331; cv=none; b=uLasWNMUW4HBB92zJfqWhs/699oITCAeJjrxUA/NkBufqfGl7ZRIq5CPxaQM8w9+sJRIGeBHWN/xVUWj0B1DOhAmdrp0tDw2U5/WchlrzC1uoHuifV/PrkgUegJXiP6NblR0cC1LgNm4MAElgYwV4q7U0BqLczQnnaVth8Ia+l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752929331; c=relaxed/simple;
	bh=SZBlAvUTaxgU1cxYHSeOXy3gDq5jLgGKKRP+AKro3v8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M5eZ1hrUpBWv/MId4a4rEV9kyxbAEMDVWbQSffFysbbBGzvAgd6zR4kVNySlKcFxi0r1GQMy/chwarE7+IPtgr4MDvLTMujaiW5uRsePYLcXtOV0vjlrT7ly8SZkX/QeMtNaZd6yI82LUpcWEERCrmiIz2DGANxINfw89X4KKlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/ICxzhC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/ICxzhC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F72C4CEE3;
	Sat, 19 Jul 2025 12:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752929331;
	bh=SZBlAvUTaxgU1cxYHSeOXy3gDq5jLgGKKRP+AKro3v8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R/ICxzhC8cEnWzVqs6l0MMBpXp9Cr+LlIIHRlcWf/5bkvFgBTYqHOTSSHdENxad1z
	 HKyzzNJa/JKo5GhK81201QRJyEoSByW+qCRw5ZiKDuUakmtF94kU7iPTpyUc81qioL
	 IJWUHwS4eWsDvKbcs+vYVny8mm/TNm5F/I3D8FNx+OD/Ui3+IieaEatr9iBxR6RDUC
	 H6lRoDbStOH0XnoSevoOCNzAChIYWAWUkyKoEb3w2aYl7sRcUQM1Tef1iMks3XQEAl
	 jHJRCrujjtOsUGuzvdj0GBxhEZAlBIYEHdAfMwVmLQSmOYb0S6hlSAO/5a7yVyTsOK
	 p7Srn1KUSC6Kg==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Bindings and DTS for Apple SoC GPUs
Date: Sat, 19 Jul 2025 14:48:38 +0200
Message-Id: <175292930365.11148.17885193055707166260.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250710-sgx-dt-v3-0-299bb3a65109@gmail.com>
References: <20250710-sgx-dt-v3-0-299bb3a65109@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 10 Jul 2025 00:21:43 +0200, Sasha Finkelstein wrote:
> This patch series adds the DT bindings and tree entries for the GPU
> present in Apple M-series SoCs. The driver itself is in Rust and
> upstream is currently missing several prerequisite bindings, so will
> be sent later.
> 
> The kernel and m1n1 (bootloader) that are using those bindings are
> available at the following branches:
> Kernel: https://github.com/WhatAmISupposedToPutHere/linux/tree/starlight
> m1n1: https://github.com/WhatAmISupposedToPutHere/m1n1/tree/bootloader-cal-blobs
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (asahi-soc/for-next), thanks!

[1/2] dt-bindings: gpu: Add Apple SoC GPU
      https://github.com/AsahiLinux/linux/commit/23a6959ff34e
[2/2] arm64: dts: Add Apple SoC GPU
      https://github.com/AsahiLinux/linux/commit/930759aaf34f

Best regards,
-- 
Sven Peter <sven@kernel.org>

