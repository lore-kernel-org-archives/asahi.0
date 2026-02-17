Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F82429CB24;
	Tue, 17 Feb 2026 18:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771352478; cv=none; b=iDMeId5sDamRIypBrgQvzJEb0ydFuw8J8EwsHnGm5Col2s+mA+yx36Hxh8li2AW+j9mrXxEjtKhj57F5Ie4FX/f0pG9DSzS7+M91KkailMHEqCGQZtGDgWQR4PbE6rWI2p2Ll5sncRygQmfE33OsmKSTaf16xv+vszs/gJMwXNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771352478; c=relaxed/simple;
	bh=46E3WWsuUMozdHBQt9dLAIDXWXgZ5h0It/eP7mZbJ28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImN4JtsmCHyHELMWlCYCUtFe68Bw2+tiDdVI1LBnya2KzQMiSck5B+8j9vIRZ0tViqse0K5e57ogwxjyZgF6BpxneyOLnbGxkU7VVMe0hPx+Lre6FMRJgNPBrlfx+BSjnmP0x3oQKPT3mPNBhe4+43XTuULJmPD/htTWCwhnN8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MHL0XcWy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MHL0XcWy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642BCC4CEF7;
	Tue, 17 Feb 2026 18:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771352478;
	bh=46E3WWsuUMozdHBQt9dLAIDXWXgZ5h0It/eP7mZbJ28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MHL0XcWyOx7oARhdS7Fg5KOHlkBLlezzUkI3p9c6ARcULDri4VA3CjS8CKiCkg1zG
	 33BTJNj7uPH99euaveyo7pqVh1dSn7t2zXUZqyUx2X9DDVKZibc+ecGpvaY1kH81J0
	 Z1WhkcuCi/w8w6zXEw9eY1T6bXuYbVekWJbOsLDdc9vR8tJG+z11st6votJcbzN9D/
	 JAV4AQPEG0I75jK5yjJkkswrhTU/L/hx4rdneaLmt8mejS37DK/+54TVddVo78pdgA
	 U9z8LA4T+oGJU4C9cQrWCbPQgx/h2g7jxThrAyMiLHDyLh4Oi/0pQXjMUJ1IFrryDf
	 wujVxig58CwHg==
Date: Tue, 17 Feb 2026 18:21:11 +0000
From: Mark Brown <broonie@kernel.org>
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: Piotr =?utf-8?Q?Mas=C5=82owski?= <piotr@maslowski.xyz>,
	Richard Fontana <rfontana@redhat.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"povik+lin@cutebit.org" <povik+lin@cutebit.org>,
	"david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
	"rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
	"cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
	"kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
	"linux-spdx@vger.kernel.org" <linux-spdx@vger.kernel.org>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] sound: soc: Add SPDX ids to many soc files
Message-ID: <ce89164e-fc08-4149-aad8-234772d38bb7@sirena.org.uk>
References: <20260214004314.3787727-1-tim.bird@sony.com>
 <DGHCVCRACU6X.2KYOL2RQWEUG7@maslowski.xyz>
 <CAC1cPGwgwPJUssJwtUmVydXEGeL-3vD7h2z5_Hb+4g=mYJfhHg@mail.gmail.com>
 <DGHF0NAEUWLD.1Z9W1ZU9LLR0H@maslowski.xyz>
 <PH0PR13MB563954A63CA5E752C8DD8FF4FD6DA@PH0PR13MB5639.namprd13.prod.outlook.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SxqphwIw0wM8EGf2"
Content-Disposition: inline
In-Reply-To: <PH0PR13MB563954A63CA5E752C8DD8FF4FD6DA@PH0PR13MB5639.namprd13.prod.outlook.com>
X-Cookie: I'm into SOFTWARE!


--SxqphwIw0wM8EGf2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 17, 2026 at 06:10:15PM +0000, Bird, Tim wrote:

> I will submit a new V2 patch with the Makefile having a GPL-2.0-only ID.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--SxqphwIw0wM8EGf2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmUsZYACgkQJNaLcl1U
h9Cmggf+NH6OFz0mGAydv12mF6F/Sq3kuyzMJCIYkRxDjij4SZkxk0qVCsBvcRCx
6T6rvD+sqH5hy4AxTuxOMXIygiIv//4ibytgnoc+Fx89IyRjF/t8tywfnshptkfu
aKWf4UV2hm+fxDlWupEiM8Qc3+iEEAZnQ47Y9g6JjsRCJO8CjLi4yFMKCEB+Aznt
Y0RmgL/jDMrXq8SaOF6oAhTqhSjysnQwZltqUD/FhV2N0RUoRDA9+97ntnLzieKl
AkG3GYhFpY9zCfWEwyQcDL7slcJBMNFC6EiOX8/XEEexTkQSVISDLr0VnHlxtLwO
2Snq5mN4WDfTSWCp6L4T9mKuraG4xw==
=dI3U
-----END PGP SIGNATURE-----

--SxqphwIw0wM8EGf2--
