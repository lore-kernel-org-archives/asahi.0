Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BE926ED3A;
	Sun, 18 Jan 2026 19:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768764853; cv=none; b=rmlx2Nl7TUZEycOmqpa9M2ea2Qju9ZCrm207yuv42JgDc08i2skuoFpgsmxu0xTVFw2nB0eldACqPWcqCRgId1o9Cbebe9hUFqZ3WirCd1FVYXROWZyY9mZRQWVE8fO6owYX3UIHrrE/mqncMSj12ih9/SKhUsTxPV9BuKqXUOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768764853; c=relaxed/simple;
	bh=EAKf7Yk7D6bJXNYB0UoN3nvCauwO9tiIU/vivFjwIJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=loEn8hKuB5aQxM4YnURDM8rjystrjwaZl2ew/5JSvkKdCHSr5/ZUjonI6OS2LuYwEy3d6t88FJSRvXN/0iPEbvSMEkuz0a2Xu5oJe6nUM6E2Q9ZeGYU7rfHn5egOvpGUPnU0YamZS4zVBu1Tx9mA5tvm0NDiyrPABfwjir8erc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hgvWHJCX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hgvWHJCX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C9EC19424;
	Sun, 18 Jan 2026 19:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768764853;
	bh=EAKf7Yk7D6bJXNYB0UoN3nvCauwO9tiIU/vivFjwIJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hgvWHJCX5yZWdp6Xl1Ced+MtQ8b5Nx16i3z6/u/15k+W7NCzdmhfSrcWKk0hanfOt
	 h707XcK8mHcuaE8w+0zhbg7xx8fLwhQ07ANtM8+0YRmHiO5aG4YWZQpyO4VwJo4GKH
	 PGQg51JcoTkJlkkjvpMgzhpTEnrpFDyYZOvgULy6gRwweU41RBnEA8QRrnoiNtv0nL
	 cjeCNoBCJHBQSHFkexNCCT37P5oEIBi4iojzhe3NjpSUgo/xJ4LSZONh6begzCg3DB
	 QzAkv8zLiR6V9LVbB4RzLc4jaRZq5LjD8uO7zHMVPvCW+0uHU534a/6nCjmO1LpLox
	 BzjwBlml8eWJQ==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: apple: rtkit: Add function to poweroff
Date: Sun, 18 Jan 2026 20:33:58 +0100
Message-ID: <176876480547.64728.18291427124643428920.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117-apple-rtkit-poweroff-v2-1-b882a180e44d@kernel.org>
References: <20260117-apple-rtkit-poweroff-v2-1-b882a180e44d@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 17 Jan 2026 18:59:10 +0100, Sven Peter wrote:
> Add a function to put a co-processor into the lowest possible power
> state from which recovery usually isn't possible without a full SoC
> reset. This is required for the USB4/Thunderbolt co-processors which
> can be restarted since the entire USB4 root complex can be completely
> reset independently of the rest of the SoC.
> 
> 
> [...]

Applied to sven/linux (apple-soc/drivers-6.20), thanks!

[1/1] soc: apple: rtkit: Add function to poweroff
      https://github.com/AsahiLinux/linux/commit/ba99035bf16e

Best regards,
-- 
Sven Peter <sven@kernel.org>

