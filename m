Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53AB327783;
	Thu,  8 Jan 2026 20:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767903858; cv=none; b=mmiZpQrXRJ1IVn5ZEpZQ1CjORHfgedSrv5DCBGgjKGvV9buWIbxX9AVa194ZxUCsk4GyUrBCpIb036RM7SjrfsK+OezNAhacjZ6PbW+LjOReFpmd9UWoV6ifbr8x507QKkjFFeDqqXFCW3UjX1Fv5l7OcZS60DmAiMHoUPdrqAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767903858; c=relaxed/simple;
	bh=r23i/DdunsLCJojJYofAoLh5i8vBW6U9Q3YvFO9vFeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O3f6Ka1VPAXIvPEEyLJzEBb0bLmfzLGLX7Ij2mQi4UajI6XdJMW4sM7kfIpFfOOFj1iCTeY+PlvYnWMVmCK9QUTC/o1V4JYExNY/sMwP0Smv/OP4GQRyTn/vB+4w/3LQXOptrxxNnHq3XLt1MMBb6IpERcnK6u/mkllTlv6fhV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJ9Ox7b+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJ9Ox7b+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD58C116C6;
	Thu,  8 Jan 2026 20:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767903858;
	bh=r23i/DdunsLCJojJYofAoLh5i8vBW6U9Q3YvFO9vFeo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CJ9Ox7b+JZXs2kfibqDtKWpSjfymLEw6DKgGG2mYhOFo/0DIRc6HJPF0EB/+Wp/s4
	 Tgh/1a1WT4j1uvXVIHjlEKCRYi693T7bbi5GHGkQXEcMHQ5aId6h1dl9zp7afpXB1P
	 sTWJ+PYl6nPILt7aaeN8HgPEyMqskKYcp99UhbCJbuf0YJjrHOER3MYRirL1Esi5eJ
	 zQ+9C878MivS9RYIphC7qfP8e7AAiL1WEvPsIP1HXUpVbaJ8CFYbgygskWKChnzJjc
	 bUgkgpHG0W0b2AsmrCHAhM6WYN7D3ui9Oz/aoseuMP4h93w3eikmgWSjcrpDhjLM0o
	 3bJEztWw4zA/Q==
From: Sven Peter <sven@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] arm64: defconfig: Enable Apple Silicon drivers
Date: Thu,  8 Jan 2026 21:23:58 +0100
Message-ID: <176790371967.51258.18187170699504242235.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231-arch-arm64-apple-defconfig-v1-0-4ff19805ba39@jannau.net>
References: <20251231-arch-arm64-apple-defconfig-v1-0-4ff19805ba39@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 31 Dec 2025 16:42:37 +0100, Janne Grunau wrote:
> Many Apple silicon specific drivers used "default ARCH_APPLE". [1]
> attempted to fix this and add the drivers to arm64's defconfig. While
> default Kconfig removals were merged adding the drivers to defconfig
> was not. A follow-up based on the discussion was never sent and then
> apparently forgotten.
> This small series addresses that. APPLE_PMGR_PWRSTATE is now selected by
> ARCH_APPLE as it is considered critical for booting just like interrupt
> controller. Since its absence does not break booting completely but
> leaves just a mostly useless system allow !PM builds without
> APPLE_PMGR_PWRSTATE.
> The defconfig change is updated to include forgotten drivers and drivers
> which were added in the meantime.
> 
> [...]

Applied to local tree (apple-soc/defconfig-6.20), thanks!

[1/2] arm64: select APPLE_PMGR_PWRSTATE for ARCH_APPLE
      https://github.com/AsahiLinux/linux/commit/92d3935e63df
[2/2] arm64: defconfig: Enable Apple Silicon drivers
      https://github.com/AsahiLinux/linux/commit/8c7a1d258d88

Best regards,
-- 
Sven Peter <sven@kernel.org>

