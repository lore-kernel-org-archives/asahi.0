Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF83D30F95C;
	Tue, 14 Apr 2026 20:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776198105; cv=none; b=RsQ8MRo3VKvHVmxAasUcZQT+OtCAtMvsUOT5splUqLE6KGZZCB62ujAUNuIHi+hsN3ywtZBhup66Ky4FARG4BT5n7pgLJvQsPZYnb7uom4WCIBYj6E0FsBcqC9fs+ASlp0iOr+rRBKKoPPH9UAEKP6raadq+MY92GcpqCleLJRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776198105; c=relaxed/simple;
	bh=dAtIVeubofBPck88/SI+wYUiOKq07a9wjnhIsv2LFZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QW0ubthWD0rKB9X3NouCrNRa0twWRVV45AUC1a2Nl+nfqrh88Pz59ZgV81Bpm2rQstdoQDRsGRBzG4e+w/2ISIEKnjOAV0ptg7Z1GBheNsUP8wH86HSKS3BIdZvnekIl0tIgzCp81y6usv3uficnlY6occl1ar7S56XDbcjaHTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jG3caVK/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jG3caVK/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A75C19425;
	Tue, 14 Apr 2026 20:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776198104;
	bh=dAtIVeubofBPck88/SI+wYUiOKq07a9wjnhIsv2LFZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jG3caVK/Bv3MnbeQfm2JCp0IttofKc3ean64Uw9LxmcR0Yu0DcIYMLH6wIcZWE/Hw
	 WRYCR3UKtgcZW4QIwCguxVE/ZH2LA2Lyl7BwxexKhYR4IkvtZTXL8oFJFNym4NAXbt
	 177E7cx7Qltw3zD5Lna1XZVwJT6pwNl7W0IyjQF87UnMge+qg+em+b+cSPUCCqucV8
	 BJa5DQFIi2jckmgx6rzMlMNwpPpdc4K/INf8D6+Y9WNBIcQcn0FFbPJCqNoPKxr+Eq
	 tWcMeFgx99zO/NNzCVu9LXUshHGMOItsOz+gq50woUyAQW5m4oN6Ou5xy4FfGdGqC2
	 RBd5okisOIXfg==
From: Sven Peter <sven@kernel.org>
To: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Axel Flordal <axel@flordal.net>
Cc: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH RESEND] arm64: dts: apple: fix spelling error
Date: Tue, 14 Apr 2026 22:21:31 +0200
Message-ID: <177619775022.3727.18063777472413149195.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2338500.vFx2qVVIhK@fedora>
References: <2338500.vFx2qVVIhK@fedora>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 08 Apr 2026 07:21:23 +0000, Axel Flordal wrote:
> Change "configiguration" to "configuration".
> 
> 

Applied to local tree (apple-soc/fixes-7.0), thanks!

[1/1] arm64: dts: apple: fix spelling error
      https://github.com/AsahiLinux/linux/commit/c7ff53ef45b2

Best regards,
-- 
Sven Peter <sven@kernel.org>

