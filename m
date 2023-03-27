Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B6133C0
	for <asahi@lists.linux.dev>; Mon, 27 Mar 2023 15:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A6EC433D2;
	Mon, 27 Mar 2023 15:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679929289;
	bh=yDuzPp/Y8i3wczmI9BSnUwzDQ290RdGPC9bThn+97ek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UTs7O88VfU3zhiuy3PLNuS7OX06Rx5bMfMxS5f/NR7RMa2p0MV06tT1IWZMxduMdJ
	 xAbWXHXGfvUWHxZ95oneOHex7FKflZfRsGZE/e6fwL6F+keOXHV2f8kNrGKa2hWBrL
	 0CjHsPSycliu1EfRdgXtlmt89UleSXSMHUKLPrpT1kStBM/uGmJL4ZY8OTJkZWnk7R
	 r2DM8Zo21V/Gv1RhHPg5o+iOuistJbmKZJ+zZz5Lg2RYvdJ2Yn6cHsW3RJ7t2Crs6W
	 cgbhohKkN06v4s9YHslWr7sDxQyfxiCcUPTqSuN+ucQ95D7wolnDMw1YsIjpIdZl2L
	 /2qsfjrsIh1eQ==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] Apple M2 PMU support
Date: Mon, 27 Mar 2023 16:01:13 +0100
Message-Id: <167992651494.3835994.856905717068311161.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230214-apple_m2_pmu-v1-0-9c9213ab9b63@jannau.net>
References: <20230214-apple_m2_pmu-v1-0-9c9213ab9b63@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 14 Feb 2023 11:38:00 +0100, Janne Grunau wrote:
> This small series adds support for the PMU in Apple M2 cores. The PMU
> itself appears to work in the same way as om M1. We still want to add
> CPU type specific compatible strings so that we can distinguish counters
> in the case they count (slightly) different things on different CPU
> uarchs.
> 
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/2] dt-bindings: arm-pmu: Add PMU compatible strings for Apple M2 cores
      https://git.kernel.org/will/c/640a3b7a3d13
[2/2] drivers/perf: apple_m1: Add Apple M2 support
      https://git.kernel.org/will/c/7d0bfb7c9977

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
