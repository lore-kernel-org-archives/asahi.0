Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078E33EBF12;
	Tue, 17 Feb 2026 18:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771354554; cv=none; b=H6hCrTS+qVCQRnC1zLWXthm9b6/U8bZW+2Hn6AXGg3vUBsaQRxc6m4CN6x/chFKgiWsw2E2PgNkX5gL78R7opesADZKjN0terovOCswRkbLwFx6vSkoDt5B4KepQUc3pjgezd4GsFQmDNHs31z8DPxuSJ99R2pQPlV+Sl/j2F3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771354554; c=relaxed/simple;
	bh=F3Kjaa27sz81NSh0NoatUECDCuF5M6AE+3F6fkwn3j8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJdlI++N0yza32Q/gl43oqo5WsWSekv0J12fTFFRjzlSQHp0dh7V+0bPAblnVNLMVvIM8MdNisYVTAhvzDmG2+g6rLkUhT8X0va6NP2KX2HgzlOZA4t4KRh81TWTgW4w5SPhsrREmDI7J8BAVRV1Wcri/+apWyrZmqRjq4DF85U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=et9FqdtM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="et9FqdtM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B34C19421;
	Tue, 17 Feb 2026 18:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771354553;
	bh=F3Kjaa27sz81NSh0NoatUECDCuF5M6AE+3F6fkwn3j8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=et9FqdtMJKV0g2ATgRPXDAmxmue2XpHfhfMvHCryK5fy4Vdlei8T7zo4ekwUN5EXe
	 SjuYLU5LJAAO45KJy+prUL9AryXDADUSm3ee5DSzPvMvelZW74qvpjkJ/G0yNa8fXW
	 7u8lSCP2fMYQhMwfTvpU7HYLh8RaR2QBB20GzoFWr4EENLAqimqUQa3vriIGKIS6eG
	 N3P6JOnDIYQycLyiHDONrKNmpCrSLe4LgbnGpfRz7dRR129jVLc1mk/mUo19MIYXqn
	 S2AITsUQKTpX4h26wtbcJGaEJSrwQ7Y8/vKUx0fJSmqPK/TQpRyMBNALmpfp3XBM2I
	 PMJ7Q2mDYqNZA==
Date: Tue, 17 Feb 2026 18:55:47 +0000
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
Message-ID: <fc5f3857-f63d-4783-946a-649b44643d6f@sirena.org.uk>
References: <20260214004314.3787727-1-tim.bird@sony.com>
 <DGHCVCRACU6X.2KYOL2RQWEUG7@maslowski.xyz>
 <CAC1cPGwgwPJUssJwtUmVydXEGeL-3vD7h2z5_Hb+4g=mYJfhHg@mail.gmail.com>
 <DGHF0NAEUWLD.1Z9W1ZU9LLR0H@maslowski.xyz>
 <PH0PR13MB563954A63CA5E752C8DD8FF4FD6DA@PH0PR13MB5639.namprd13.prod.outlook.com>
 <ce89164e-fc08-4149-aad8-234772d38bb7@sirena.org.uk>
 <PH0PR13MB56393C31148DB34E20B703E5FD6DA@PH0PR13MB5639.namprd13.prod.outlook.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LUz1C170KQRkGs54"
Content-Disposition: inline
In-Reply-To: <PH0PR13MB56393C31148DB34E20B703E5FD6DA@PH0PR13MB5639.namprd13.prod.outlook.com>
X-Cookie: I'm into SOFTWARE!


--LUz1C170KQRkGs54
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 17, 2026 at 06:32:16PM +0000, Bird, Tim wrote:

> Thanks for the feedback.  Just to clarify, I believe you are saying I should have
> used a Subject prefix of 'ASoC:' instead of 'sound: soc:'.  Is that right?

Yes.

--LUz1C170KQRkGs54
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmUubIACgkQJNaLcl1U
h9CkpAf9F0pfvfrCflCqAIEhASi5xtGQtFq+ifhGpsBdklgq1EYUC4RJU1yUWCpC
8Aq8EPO1HIXJ6FVPLO8XCtVquKfs5ROAtGFqJS2Oxx0p2KShWAWaZad704hm2Asm
p99NDdrMDiFPt40ctFGmgI8h9BzrJju5qOm4KjlURfr3rn6Mytv//E6C/ZUd8kD7
WwjtB9C4N8ZsUZb7E4glMWSo5ViSo0ScZFUabuTVI0K80k7SKE1shGqE7/5dvtbb
lgkLjyr1XlJ2YOdaH5QzESNmRpJvNE9iEr+GM3cv9MsBDhH9OMu7+Rj3rQLsbo9Z
/0fnd1K55Gc9Cuy0On1SY1weZMK/Ng==
=zDDu
-----END PGP SIGNATURE-----

--LUz1C170KQRkGs54--
