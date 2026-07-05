Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0038030DEB8;
	Sun,  5 Jul 2026 14:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783261782; cv=none; b=ccAJBv63H2VDYtJP6hHkctKAJCxbcKSITU8FJOdnDcDS4GoQqCGwN9nDruWp+7ETvc5kxMR6PAILZs2dtVwURwjPtcWQw3Lyw+0A3eZq93daP4otpH7spBV1qoZ8FsShd4YzrityqEelWSE6HAqsyc8xsqexGTymbIFFLfTl0+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783261782; c=relaxed/simple;
	bh=aTQB9I56qpGc7k2PF7UujZYTkSz/JMzdZU7c0c0lm6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gOF+q0QsjCvVsAON/dMN2VWZMlHTzi02fXYlETQOgj74KA3jOwisQN1U+oA3glt0GzEdE2r1oWRBOOERSLeO9rc7sxJEwuL1202pwpA7eAreLkQ6caLAj/IPcUWFOE85RJdvAZQB+itlLwdgXiM5hP+V/Qm+hO1pkJjz2VOBl2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IpbWHNL4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IpbWHNL4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C93C81F000E9;
	Sun,  5 Jul 2026 14:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783261781;
	bh=ME+6HlD+08OSFpQWIBYN3eSrff9bfZygMLpwYCEDWAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IpbWHNL4aDE28VUq7IZtUjfCn/nl9ZeT8TI5RezI4FqO61dP6vpN3LUIztZD5X/Ix
	 JdqMyS3n/L5rY/kTYGAhgsRu+GB4YlQD5QhkGF/3Cg0DjBmlKr+gbudAZfi9/sNRc/
	 52SQQTO/hUuZzMGGipFVTAjJg0zjI1nulzuT8lXYpK/V8n4VO3Rz79FoaW4jowZzZ0
	 CpxilAAHS23Fu4CfTNd05JnzDRPTy15IaWw9vtumtN+pXvRqPgguepv2l/lxqgfH/k
	 4D6OE8qxhfdN94LFaDakfO2GQIbH9pAp3aCqbPtdubX29XemcBUuGxp/RC7PPjDCje
	 Gi90nllJfFWiA==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joshua Peisach <jpeisach@ubuntu.com>,
	Michael Reeves <michael.reeves077@gmail.com>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: apple: t8122: Fix I2C resources
Date: Sun,  5 Jul 2026 16:29:27 +0200
Message-ID: <178326164442.9177.5710655356580684765.b4-ty@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260629-t8122-i2c-fix-v1-1-cec044001550@gmail.com>
References: <20260629-t8122-i2c-fix-v1-1-cec044001550@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 29 Jun 2026 20:01:01 +1000, Michael Reeves wrote:
> Correct the MMIO ranges and IRQs for T8122 I2C controllers.
> They were mistakenly incorrect in the original commit. This
> fix is required for i2c dependent hardware to function
> correctly, i.e. audio codecs.
> 
> Tested on J613 (MacBook Air M3).
> 
> [...]

Applied to sven/linux (apple-soc/fixes-7.2), thanks!

[1/1] arm64: dts: apple: t8122: Fix I2C resources
      https://github.com/AsahiLinux/linux/commit/09780b4b4bdc

Best regards,
-- 
Sven Peter <sven@kernel.org>

