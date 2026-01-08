Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A7F1A23A0;
	Thu,  8 Jan 2026 20:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767903357; cv=none; b=k7yXOICM9KdGN5/Xh1rKYzNqCx55HchPpvZ36/wwiI7OvUbC6Ml96i754q5/eUAa6X+oLs1YJYd5zP3IH8Rb0xcOuyen6778EFmIiVyCSgCd3EdelB1t1bs/4TfGZSdQiUK7866pUCkIi6pTe7y+WWFWZmOWniAVNlnUaqLdf3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767903357; c=relaxed/simple;
	bh=w3ns41X2j9YcbCC/Ab57NoK6rddbx0g6MGo+CbaUMmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tej28lI1epY/clQ1e1Hl3QEbIAG0a+UIlMg/sbu5rfFlFge5cwIlpRdG0ktuh/jw1/t0Y/hx6ZqVITtYKI4m+C2fxpGBVt0w/b66e0/Cw0YyNK4yfRCLYTXfajtOgW3WCiSoRRDsdJVcKJmYXzruJxntkB8rZ11fRAME+9k2pSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=clUFWDVr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="clUFWDVr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF72C116C6;
	Thu,  8 Jan 2026 20:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767903357;
	bh=w3ns41X2j9YcbCC/Ab57NoK6rddbx0g6MGo+CbaUMmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=clUFWDVrU90Xs52DJ44rpCuPjjkivn59SbJ4mWCuyP6aIDITw2My4hka5y4Sejj0n
	 jrPkZ9qppK05vivrjXjdKg8e2fyDawH1pmA062zucaUODcrbhvPGIVk/R3pTgowS+7
	 nErVNfPd8gUKqSHbY+v8ENdJ7vqkMOpoiFCTbZiQSAcJR3u+Hhl3lpMoa38qrJtTRl
	 1HQxNcUoE20m4yie5kvOJ4pGwyT02vh2MXLzm9laKqSiPsjKD0ZJ36BwlzTybpotJm
	 mcUfAJqsDZI4/ek64/1fUISxwDcZzcmjwcWkr1o2F9iDuYjMLJMcKuX87vSQ4Fzcgl
	 UiLi/FoDTxY8Q==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nick Chan <towinchenmi@gmail.com>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: apple: s8001: Add DWI backlight for J98a, J99a
Date: Thu,  8 Jan 2026 21:15:38 +0100
Message-ID: <176790311758.49068.4809828865435473528.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231-b4-j98a-j99a-dwi-bl-v1-1-24793c2b99fc@gmail.com>
References: <20251231-b4-j98a-j99a-dwi-bl-v1-1-24793c2b99fc@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 31 Dec 2025 02:30:42 +0800, Nick Chan wrote:
> iPad Pro (12.9-inch) uses DWI backlight, while the 9.7-inch model does not.
> Add DWI backlight node for s8001 and enable it for J98a and J99a.
> 
> 

Applied to AsahiLinux/linux (apple-soc/dt-6.20), thanks!

[1/1] arm64: dts: apple: s8001: Add DWI backlight for J98a, J99a
      https://github.com/AsahiLinux/linux/commit/591cf7900da5

Best regards,
-- 
Sven Peter <sven@kernel.org>

