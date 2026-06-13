Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BD62D238F
	for <asahi@lists.linux.dev>; Sat, 13 Jun 2026 21:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781387867; cv=none; b=Xwi8nuqx52ChrTLT9fWzfpCZ+56SgfBnGIVvEDAhOHRcvF5S9Yi/LuNcXN6l839ZZjakHP74scFXqJfqAgVzhKAIg/nYuXYSyjH7n6yDSYyece6VUjys0+6ZBMriCkvdkIG9hhSLQulw69Tu93t4j/gKfDPGEm6y5+0wT3ovmwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781387867; c=relaxed/simple;
	bh=jNX/lSr1eAIewD5raDSzWjla5fQS29KFlsi+CQtdSy0=;
	h=Content-Type:MIME-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=BM+KkuygkG4xxHT2TOZfMxDJZSRYEniDMLOOTrZWHK+VJiqreXOmSDfXUbPoxxlXA4DyIrBIV3SfNhgfelUc8wyCqWU8luNMSJQ53Y+nmqQbgCdYUBFwIrasKT7hh3OfV0OEL5dvVn4QO2/7VfIH2P5REKpY5+ns1MLIm0jeszc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=eUF3MRlF; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="eUF3MRlF"
Received: by chaosmail.tech (Postfix) id 753921C812E;
	Sat, 13 Jun 2026 21:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1781387856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jNX/lSr1eAIewD5raDSzWjla5fQS29KFlsi+CQtdSy0=;
	b=eUF3MRlF0nhurOSYnUXvjSua8K2fyjsXiMvEXe9vOC+78PzdiSSx+TP6JLIhewVcVel9ls
	m+HTOfju9Wh6N7LZxozaV5nJkUeIYC8WYQE1nldOzSNDhQamyq9XmAwr9/aUT+gazaCV3Q
	cpm/nHWyqvXsE5eFMJ4BEjx0m8x0Ik0=
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] Input: apple_z2 - bound the device-reported packet length
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20260613-b4-disp-b1926f1a-v1-1-3a277b7c0cfa@proton.me>
Date: Sat, 13 Jun 2026 23:57:25 +0200
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Neal Gompa <neal@gompa.dev>,
 linux-input@vger.kernel.org,
 asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C6E5770E-7102-4D12-B8BF-58F902FE8176@chaosmail.tech>
References: <20260613-b4-disp-b1926f1a-v1-1-3a277b7c0cfa@proton.me>
To: hexlabsecurity@proton.me


> On Jun 13, 2026, at 23:42, Bryam Vargas via B4 Relay =
<devnull+hexlabsecurity.proton.me@kernel.org> wrote:
>=20
> From: Bryam Vargas <hexlabsecurity@proton.me>
>=20
> [...]
> Reject any packet whose length exceeds the receive buffer.
>=20

Reviewed-by: Sasha Finkelstein <k@chaosmail.tech>

Although, if you reject the packet, the datastream will be desynced and
the device should be reset before it can operate again.

