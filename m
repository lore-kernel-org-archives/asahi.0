Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEB523E358;
	Tue, 14 Apr 2026 20:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776198137; cv=none; b=iSnEvqUXZyJ+46SvqXZcb8pKGiotpUsq6eOL7BjCRfQZqCtDhv9hymSEJNo2Vh8XYtDQiGhlbUWsoiQHaC7sIR4sltB4AWA8GRGbobn0U5YBNgrkAvQZ4lLHCPtaCZLNsT6nB1EXET3N7vMxcdFQ5NmxXZDLpoeGRRn6U1rMH9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776198137; c=relaxed/simple;
	bh=u8VoH0br5aPKxM88rZ468ccIiZFO2OyEnXm8yn1sFoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t4qWVS4q9m1UuFbxKN6+y6b48G9w0/l6TtUiFhSt54FZCYYu6cZnR3pf0PwKsIKSJ4bO75I/YyRmNsWc2r3fS5O+2yx9Q/Xu8BRYcbWcWw02JtHJjKQGrEWOMLvLaFHZ3SiGWM3O4T8jarckDpRul+MC8Akcr4Vb9pwdG1PKK4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZv4kwTn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZv4kwTn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCFACC19425;
	Tue, 14 Apr 2026 20:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776198137;
	bh=u8VoH0br5aPKxM88rZ468ccIiZFO2OyEnXm8yn1sFoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mZv4kwTn3d3oY3PpENWwiKPw99H1poJ53Cp9LpExkbQzdTFANpZu8a09rb6aGHRhd
	 ROc+1FfHi3mmfTQkPQgF+5hZNk7pup0NKDmM+YgnEmLIiISVF2+mW4E8Eh8t1FIiJc
	 YH02tjDD7Nyu2eaA66UoCzee1yQiK7mG5nN6cTRisDlGTeJ30vVYBJJKpTlqIVpHeX
	 MLloz0soe4UuRu++BER7gGkUs7++xdB3Gh+06h4IQyr+jce1sGUgue6CziQ2SQofeP
	 ogJMWZXQwrhmd2txQkU/MUgrB3nlfLZT4uPYmZUurUFxSYysrWwgsj6l2en7JFpATB
	 UBMqC1H2Bazyg==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev,
	Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] Update Sasha Finkelstein's email address
Date: Tue, 14 Apr 2026 22:21:58 +0200
Message-ID: <177619775021.3727.15345405608996383354.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411-mailmap-v1-0-5a519f7b00b5@chaosmail.tech>
References: <20260411-mailmap-v1-0-5a519f7b00b5@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 11 Apr 2026 16:36:06 +0200, Sasha Finkelstein wrote:
> Moving away from gmail
> 
> 

Applied to local tree (apple-soc/fixes-7.0), thanks!

[1/2] mailmap: Update Sasha Finkelstein's email address
      https://github.com/AsahiLinux/linux/commit/b04a4f8ff704
[2/2] dt-bindings: Update Sasha Finkelstein's email address
      https://github.com/AsahiLinux/linux/commit/44d9ae042c58

Best regards,
-- 
Sven Peter <sven@kernel.org>

