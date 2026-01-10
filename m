Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E146312805;
	Sat, 10 Jan 2026 10:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768041602; cv=none; b=HAGM/f64lUFvWDMAlVarJaseVDTKLmnxCV2M+2ZhNNB2QdxSOZjoc9rIMXB8vrSESQCpqJQBvztAznnfqZV5ai+ojz5RVtBQ4LMcZzuEd4hG2VGM2nLldrfD5s1FuLSFbqDEWbsQW/LL2xVPiU6U2vOh5n9T+mh7VLgsgBVYbPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768041602; c=relaxed/simple;
	bh=zr3h/cXPfisO04N/W+Ln8th0Opzkj243Gue7txsalzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OWVE1zjLUDeFZbwlPYctD1+qVqFcSZO3zL9hc3jfWrGdsnDMuGcvo03qr3NR7nUngjgAiCKrt7X4QEub8Y/bi8EtEX+tTQpQyMdAg69w9Z8ZBbN9PsGgMjCI0QZeOqmIUsTrUB8QKHA7R5pNOoGSfDYqCxAP1rg1CX3CKZ5Tb4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hDmy/XO6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hDmy/XO6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE128C4CEF1;
	Sat, 10 Jan 2026 10:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768041600;
	bh=zr3h/cXPfisO04N/W+Ln8th0Opzkj243Gue7txsalzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hDmy/XO6m642n5wRoU7wZnPIx3AuSsL6Hib8bS4/aRW5zBxTw5hLs/orrbVeLsBO1
	 6g0WxOHYX84ReBt6NtBhqzAFGMwil1my3ULU5n0RLFAd+ewX1UNgJK6VzT7+Qw9Ylq
	 vT9GsCF99h/V//4g2NTh9VVZe+X1xuWUF9klVOPP38PugTUK/wga60QXVOifQB6KJg
	 /G6X6KoewyTQpGRVBItbPQZZ2A1Gg4XtpQOAtyPTF6Z8/CkOx4qpKd6vFXdxFqcv1H
	 aQAD4fraujy/RTMFkkDFiTPimXcOzy6u512Jc0nKjoYECpX/XndqOrfxPgsqjssrlL
	 lo4bMqTvlO9cw==
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] arm64: dts: apple: Add chassis-type properties
Date: Sat, 10 Jan 2026 11:39:37 +0100
Message-ID: <176804152716.3568.1765337883482997730.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109-apple-dt-chassis-type-v1-0-c215503734c5@jannau.net>
References: <20260109-apple-dt-chassis-type-v1-0-c215503734c5@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 09 Jan 2026 16:25:42 +0100, Janne Grunau wrote:
> Add chassis-type properties for all Apple silicon Macs. "chassis-type"
> is used by u-boot to fill the SMBIOS "System Enclosure or Chassis Type"
> field. User space software uses this field to to determine if a device
> is an laptop. The exact use case eludes me unfortunately.
> 
> The Mac Pro uses "server" as chassis-type which is not entirely
> accurate. The tower and rack mount Mac Pro versions share the same .dts
> file and are identical except for the enclosure. I haven't found an
> obvious property in Apple's device tree to distinguish between those so
> both use "server" instead of the more accurate "tower" and "rack mount
> chassis". The latter chassis-types are not in dt-schema anyway.
> 
> [...]

Applied to AsahiLinux/linux (apple-soc/dt-6.20), thanks!

[1/4] arm64: dts: apple: Add chassis-type property for all Macbooks
      https://github.com/AsahiLinux/linux/commit/b73d48c14ad5
[2/4] arm64: dts: apple: Add chassis-type property for Apple desktop devices
      https://github.com/AsahiLinux/linux/commit/96b603324985
[3/4] arm64: dts: apple: Add chassis-type property for Mac Pro
      https://github.com/AsahiLinux/linux/commit/81a683f864a9
[4/4] arm64: dts: apple: Add chassis-type property for Apple iMacs
      https://github.com/AsahiLinux/linux/commit/8714184b7bcb

Best regards,
-- 
Sven Peter <sven@kernel.org>

