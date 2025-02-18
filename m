Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC9326D5AF
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 15:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.8.165.127
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739894125; cv=none; b=uOj7pdPY98BaMm8CaZ1hFWvixQ7Nfd/CeIqd8ZntFXuBsq464qSpfPW+kJX0hHxjz04OunfisR+j3aHUTwB0A5/7Rzaq+Phf8EDrKPtMyA4Mm8qIWnjB6sAjELSrwjZe/okfDgS/yCN264Sr4a6iAQvTHdtBNcEx1ke3IHk5+aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739894125; c=relaxed/simple;
	bh=c9eaYGLNzWL3GJd3vFOqhcsQyavxwxygz0CVnKMezSs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=QtSNKRJHc8mwfz/1fG1MXVWdZvZHefYUZ6fMWT7WLEBdpvsSw/CXJCDwTr0mT4zuKu7I+Kbjy7QTBMwtrrdTwPJP7EuNNXVWBoOwMgSzRcLAL8J5DpQLkdbLOmkLzpA57ARXMS1B1B1xIqei0bgaBnz2qz1AszQujNhHRcuIUlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cutebit.org; spf=pass smtp.mailfrom=cutebit.org; dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org header.b=rHRZbKHK; arc=none smtp.client-ip=185.8.165.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cutebit.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cutebit.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org header.b="rHRZbKHK"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1739894114; bh=ywKxy9prbcwcaAfRCni6BG0WDIZ41n19udWBOyMwYsA=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=rHRZbKHKCD4TlTItdInvYcDcoDYpNddBysjvms+rfzj3jqRHrHqlQdWabZVgAuPOu
	 NVKs/tXAt1SZ8uHB5RjkHS8PMeI0OYDHELiqIwc7Bm/WW2BinR2LRFkGCCAPwd/FPt
	 Hvg6qBIh+JBMfHk9F0Venaa4rhDMgI73ma2LgWjM=
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH v2 17/29] ASoC: tas2764: Crop SDOUT zero-out mask based on
 BCLK ratio
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <Z7SmcfaGQpGG81Pw@finisterre.sirena.org.uk>
Date: Tue, 18 Feb 2025 16:55:04 +0100
Cc: Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 asahi@lists.linux.dev,
 linux-hwmon@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6553EEBD-B64F-4985-8CC6-2BBA7B6AAC91@cutebit.org>
References: <20250218-apple-codec-changes-v2-0-932760fd7e07@gmail.com>
 <20250218-apple-codec-changes-v2-17-932760fd7e07@gmail.com>
 <Z7SmcfaGQpGG81Pw@finisterre.sirena.org.uk>
To: James Calligeros <jcalligeros99@gmail.com>


> On 18. 2. 2025, at 16:25, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Tue, Feb 18, 2025 at 06:35:51PM +1000, James Calligeros wrote:
>> From: Martin Povi=C5=A1er <povik+lin@cutebit.org>
>>=20
>> Reviewed-by: Neal Gompa <neal@gompa.dev>
>> Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>
>> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
>=20
> Again, why do this?  Is this a bug fix of some kind (ie, does the
> hardware misbehave if we get this wrong) or is it just for neatness?

James,

I=E2=80=99ve found the language in the datasheet which made me make this =
change:

"This register to be programmed as zero in case the slot is not valid as =
per valid FSRATIO=E2=80=9D

Martin

